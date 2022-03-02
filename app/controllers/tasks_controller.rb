class TasksController < ApplicationController
  def index
    @tasks = Task.where(user: current_user).order(:end_date)
    @user_service = current_user.user_services
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @user_service = UserService.find(params[:user_service_id])
    @service = Service.find(@user_service.service1)
    @task.user_service = @user_service
    @task.user = current_user

    if @task.save
      redirect_to tasks_path(@task)
    else
      render :new
    end
  end

  # def edit
  #   @task = Task.find(params[:id])
  # end

  # def update
  #   @task = Task.find(params[:id])
  #   @task.update(task_params)
  #   redirect_to task_path
  # end

  # def destroy
  #   @task = Task.find(params[:id])
  #   @task.destroy
  #   redirect_to tasks_path
  # end

  private

  def task_params
    params.require(:task).permit(:title, :description, :done, :end_date)
  end
end
