class ReviewsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @review = Review.new(review_params)
    @review.user = @user
    if @review.save
      render 'users/show'
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
