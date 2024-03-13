class ServicesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show ]

  def index
    @services = Service.all
    @service1 = Service.first
  end

  def new
    @service = Service.new
  end

  def show
    @service = Service.find(params[:id])
    @line_item = LineItem.new
    @markers = [
      {
        lat: @service.latitude,
        lng: @service.longitude,
        marker_html: render_to_string(partial: "marker")
      }
    ]
  end

  def create
    @service = Service.new(service_params)
    @service.user_id = current_user.id
    if @service.save
      redirect_to service_path(@service)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @service = set_service
    if current_user.id == @service.user.id
      @service = set_service
    else
      redirect_to service_path(@service)
    end
  end

  def update
    @service = set_service
    if @service.update(service_params)
      redirect_to service_path(@service)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @service = Service.find(params[:id])
    @service.destroy

    redirect_to @service, status: :see_other
  end

  private

  def service_params
    params.require(:service).permit(:service_type, :title, :price, :rating, :description, :user_id, :address, :longitude, :latitude, :date, :photo)
  end

  def set_service
    @service = Service.find(params[:id])
  end
end
