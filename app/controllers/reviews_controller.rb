class ReviewsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @review = Review.new(review_params)
    @review.user = @user
    if @review.save
      redirect_to items_path(@review.item)
      # redirect_to items_path(@item.owner, item_id: @item.id)
      # original redirect_to items_path(@review.item)
      # redirect_to items_path(item_id: @item.id)
    else
      render :new
    end
  end

  def new
    @user = User.find(params[:user_id])
    @review = Review.new
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end
