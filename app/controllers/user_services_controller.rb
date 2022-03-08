class UserServicesController < ApplicationController
  def index
    @user_services = UserService.where(user: current_user)
    @services = Service.where.not(id: current_user.services)
    @doughnut_data = {
      labels: @user_services.map { |us| us.service.name },
      datasets: [{
        label: 'My First dataset',
        backgroundColor: @user_services.map { |us| us.service.color },
        # borderColor: '#3B82F6',
        data: @user_services.map do |us|
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

  def show
    @user_service = UserService.find(params[:id])
    @service = @user_service.service

    @marker = [
      {
        lat: @user_service.latitude,
        lng: @user_service.longitude
      }
    ]
  end

  def new
    @user_service = UserService.new
    @service = Service.find(params[:service_id])
    # @user_service.service = @service
  end

  def create
    @user_service = UserService.new(user_service_params)
    @service = Service.find(params[:service_id])
    @user_service.service = @service
    @user_service.user = current_user
    @service.service_tasks.each do |st|
      t = Task.create!(title: st.title, description: st.description, end_date: Date.today + st.offset_day, user: current_user, user_service: @user_service)
    end
    if @user_service.save
      redirect_to user_services_path
    else
      render :new
    end
  end

  def update
    @user_service = UserService.find(params[:id])
    @user_service.update(user_service_params)
    redirect_to user_services_path
  end

  def edit
    @user_service = UserService.find(params[:id])
  end

  def destroy
    @user_service = UserService.find(params[:id])
    @user_service.tasks.destroy_all
    @user_service.destroy
    redirect_to user_services_path
  end

  def user_service_params
    params.require(:user_service).permit(:contact_name, :contact_email, :contact_address, :contact_phone)
  end
end
