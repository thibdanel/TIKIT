class UserServicesController < ApplicationController

  def index
    @user_services = UserService.where(user: current_user)

  end

  def show
    @user_service = UserService.find(params[:id])
    @service = @user_service.service

    # @markers = @user_service.geocoded.map do |us|
    #   {
    #     lat: us.latitude,
    #     lng: us.longitude
    #   }
    # end
    @marker = [
      {
        lat: @user_service.latitude,
        lng: @user_service.longitude
      }
    ]
  end

  def update
    @user_service = UserService.find(params[:id])
    @user_service.update(user_service_params)
    redirect_to new_user_service_task_path
  end

  def edit
    @user_service = UserService.new(params[:service_id])
  end

  def destroy
    @user_service = UserService.find(params[:id])
    @user_service.destroy
    redirect_to new_user_service_task_path
  end
end
