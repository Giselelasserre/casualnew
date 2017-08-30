class ReviewsController < ApplicationController
  def create
    @user = current_user
    @review = Review.new(review_params)
    @review.user = @user
    @item = Item.find(params[:item_id])
    @review.item = @item
    if @review.save
      redirect_to item_path(@item)

    else
      render :new
    end
  end

  def new
    @user = current_user
    @item = Item.find(params[:item_id])
    @review = Review.new
  end

  private

  def review_params
    params.require(:review).permit(:content, :star)
  end
end
