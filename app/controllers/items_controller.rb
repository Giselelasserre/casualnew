class ItemsController < ApplicationController
  skip_before_filter :authenticate_user!, only: [:index, :show]

  def index
    # @items = Item.all
    if params[:location].present?
      @items = @items.near(params[:location], 20)
    else
      @items = Item.where.not(latitude: nil, longitude: nil)
    end

    @hash = Gmaps4rails.build_markers(@items) do |item, marker|
      marker.lat item.latitude
      marker.lng item.longitude
      # marker.infowindow render_to_string(partial: "/flats/map_box", locals: { flat: flat })
    end
  end

  def show
    @purchase = Purchase.new
    @item = Item.find(params[:id])
    @alert_message = "You are viewing #{@item.name}"
    @item_coordinates = { lat: @item.latitude, lng: @item.longitude }
    @hash = Gmaps4rails.build_markers(@flat) do |item, marker|
      marker.lat item.latitude
      marker.lng item.longitude
      # marker.infowindow render_to_string(partial: "/flats/map_box", locals: { flat: flat })
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

    redirect_to items_path # We'll see that in a moment.
  end

private

  def item_params
    # *Strong params*: You need to *whitelist* what can be updated by the user
    # Never trust user data!
    params.require(:item).permit(:location, :description, :price, :title)
  end
end
