class TasksController < ApplicationController
  def index
    @tasks = Task.where(user: current_user).order(:end_date)
    @user_service = current_user.user_services
    @service = Service.where(user: current_user)
    @services = @tasks.map do |task|
                  task.user_service.service.name
                end
    @services.uniq!
  end

  def new
    @task = Task.new
    @user_service = UserService.find(params[:user_service_id])
    @action = "Add your Task"
  end

  def create
    @task = Task.new(task_params)
    @user_service = UserService.find(params[:user_service_id])
    @service = Service.find(@user_service.service_id)
    @task.user_service = @user_service
    @task.user = current_user

    if @task.save!
      redirect_to tasks_path(@task)
    else
      @action = "Add your Task"
      render :new
    end
  end

  def edit
    @task = Task.find(params[:id])
    @user_service = UserService.find(params[:user_service_id])
    @action = "Update your Task"
  end

  def update
    @task = Task.find(params[:id])
    @user_service = UserService.find(params[:user_service_id])
    @service = Service.find(@user_service.service_id)
    @task.user_service = @user_service
    @task.user = current_user
    if @task.update(task_params)
      redirect_to tasks_path(@task)
    else
      @action = "Update your Task"
      render :edit
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :done, :end_date)
  end
end
