class ReviewsController < ApplicationController
  before_action :set_service, only: %i[new create]
  def show

  end

  def new
    @service = Service.find(params[:service_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.service = @service
    if @review.save
      redirect_to service_path(@service)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to service_path(@review.service), status: :see_other
  end

  private

  def set_service
    @service = Service.find(params[:service_id])
  end

  def review_params
    params.require(:review).permit(:comment, :order_id, :rating)
  end
end
