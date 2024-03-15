class ServicesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show search]

  def index
    @service1 = Service.first
    if params[:title]
      @services = Service.where(title: params[:title])
    else
      @services = Service.all
    end
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

  def search
    term = params[:title]
    # Realiza una búsqueda en tu modelo Wine para obtener sugerencias basadas en el término de búsqueda
    suggestions = Service.where('title ILIKE ?', "%#{term}%").pluck(:title).uniq
    render json: suggestions
  end

  private

  def service_params
    params.require(:service).permit(:service_type, :title, :price, :rating, :description, :user_id, :address, :longitude, :latitude, :date, photos: [])
  end

  def set_service
    @service = Service.find(params[:id])
  end
end
