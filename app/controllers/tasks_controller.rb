class TasksController < ApplicationController
  add_flash_types :created, :finished
  def index
    @tasks = Task.where(user: current_user)
    @tasks_not_done = @tasks.where.not(done: true)
    @user_service = current_user.user_services
    # @services = Service.where(user: current_user)
    @services = @tasks.map do |task|
      task.user_service.service.name
    end
    @services.uniq!

    @doughnut_data = {
      labels: @user_service.map { |us| us.service.name },
      datasets: [{
        label: 'My First dataset',
        backgroundColor: @user_service.map { |us| us.service.color },
        # borderColor: '#3B82F6',
        data: @user_service.map do |us|
          count = []
          us.tasks.each do |task|
            if task.done == false
              count << task
            end
          end
          count.size
        end
      }]
    }
    @doughnut_options = {
      scales: {
        yAxes: [{
          ticks: {
            beginAtZero: true,
            width: 200,
            height: 200
          }
        }]
      },
      plugins: {
        legend: {
          position: 'right'
        }
      }
    }
  end

  def new
    @task = Task.new
    @action = "Add your Task"
    @user_service = UserService.find(params[:user_service_id])
    @marker = [
      {
        lat: @user_service.latitude,
        lng: @user_service.longitude
      }
    ]
  end

  def create
    @task = Task.new(task_params)
    @service = Service.find(@task.user_service.service_id)
    @task.user = current_user

    if @task.save!
      FakeJob.perform_now
      redirect_to tasks_path(@task), created: 'Successfull created'
    else
      @action = "Add your Task"
      render :new
    end
  end

  def edit
    @task = Task.find(params[:id])
    @action = "Update your Task"
    @user_service = UserService.find(params[:user_service_id])
    @marker = [
      {
        lat: @user_service.latitude,
        lng: @user_service.longitude
      }
    ]
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
    redirect_to tasks_path(@task), finished: 'Successfull finished'
  end

  # def fetch_nearly_expired_tasks
  #   @tasks = Task.where(user_id: current_user.id, done: false)
  #   @nearly_done_tasks = @tasks.filter do |task|
  #                          task.end_date.day - Date.today.day <= 5
  #                        end
  # end

  private

  def task_params
    params.require(:task).permit(:title, :description, :done, :end_date, :user_service_id)
  end
end
