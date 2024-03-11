class UsersController < ApplicationController
  def show
    @service = Service.where(user_id: current_user.id).first
    if @service
      @user = current_user
    else
      redirect_to @service
    end
  end

  def edit
    if current_user.id == set_service.user.id
      @service = set_service
    else
      redirect_to service_path
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

  def profile; end

  private

  def set_params
    Service.find(params[:service_id])
  end
end
