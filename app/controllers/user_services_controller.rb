class UserServicesController < ApplicationController
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