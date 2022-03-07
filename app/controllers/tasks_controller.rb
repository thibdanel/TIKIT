class TasksController < ApplicationController
  def index
    @tasks = Task.where(user: current_user).order(:end_date)
    @user_service = current_user.user_services
    # @services = Service.where(user: current_user)
    @services = @tasks.map do |task|
                  task.user_service.service.name
                end
    @services.uniq!
  end

  def new
    @task = Task.new
    @action = "Add your Task"
  end

  def create
    @task = Task.new(task_params)
    @service = Service.find(@task.user_service.service_id)
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
    @action = "Update your Task"
  end

  def update
    @task = Task.find(params[:id])
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

  def finished
    @task = Task.find(params[:id])
    @task.done = true
    @task.save
    redirect_to tasks_path(@task)
  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :done, :end_date, :user_service_id)
  end
end
