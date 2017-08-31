class ItemsController < ApplicationController
  skip_before_filter :authenticate_user!, only: [:index, :show ]

  def index
    @items = Item.available

    if params[:address].present?
      @items = @items.near(params[:address], 20)
    else
      @items = Item.available.where.not(latitude: nil, longitude: nil)
    end

    if params[:category].present?
      @items = @items.where(category: params[:category])
    end

    if params[:size].present? && params[:size] != "All"
      @items = @items.where(size: params[:size])
    end

    if @items.none?
      flash.now[:alert] = "Sorry, this item is not currently available!"
    end

    @hash = Gmaps4rails.build_markers(@items) do |item, marker|
      marker.lat item.latitude
      marker.lng item.longitude
    end
  end

  def my_items
    @items = current_user.items
  end

  def show
    @purchase = Purchase.new
    @item = Item.find(params[:id])
    @suggested_items = @item.suggestions
    @alert_message = "You are viewing #{@item.item_name}"
    @item_coordinates = { lat: @item.latitude, lng: @item.longitude }
    @hash = Gmaps4rails.build_markers(@item) do |item, marker|
      marker.lat item.latitude
      marker.lng item.longitude
    end
  end

  def new
    @item= Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.owner = current_user
    if @item.save
      redirect_to item_path(@item), notice: "Sucessfully added!"
    else
      flash.now[:alert] = @item.errors.full_messages.join(', ')
      render "new"
    end
  end

  def edit
    @item = Item.find(params[:id])


  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)

    redirect_to item_path(@item) # We'll see that in a moment.
  end


  def destroy
    @item = Item.find(params[:id])
    @purchases = @item.purchases
    @item.destroy
    redirect_to my_items_path

  end



private

  def item_params
    # *Strong params*: You need to *whitelist* what can be updated by the user
    # Never trust user data!
    params.require(:item).permit(:category, :address, :item_name, :size, :price, :days_delivery, :description, photo_items: [])
  end
end

