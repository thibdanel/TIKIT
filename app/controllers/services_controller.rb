class ServicesController < ApplicationController
  def index
    @services = Service.all
  end

  def show
    @service = Service.find(params[:id])
    @user_service = UserService.find_by(service: @service, user: current_user)

  end

  def edit
    @service = Service.find(params[:id])
    @user_service = UserService.find_by(service: @service, user: current_user)
  end

  def new
    @service = Service.new
  end

  def create
    @service = Service.new(service_params)
    if @service.save
      redirect_to new_service_user_service_path(@service)
    else
      render :new
    end
  end

  def destroy
    @service = Service.find(params[:id])
    @service.service_tasks.destroy_all
    @service.user_services.destroy_all
    @service.destroy
    redirect_to user_services_path
  end

  def service_params
    params.require(:service).permit(:name, :description, :color, :photo)
  end
end
