class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :fetch_nearly_expired_tasks, if: @increment_count
  after_action :increment_count

  def after_sign_in_path_for(resource)
    user_services_path(current_user)
  end

  def fetch_nearly_expired_tasks
    @tasks = Task.where(user_id: current_user.id, done: false)
    @nearly_done_tasks = @tasks.filter do |task|
                           task.end_date.day - Date.today.day <= 5
                         end
  end

  def increment_count
    @count = 0
    @count < 1? @count += 1 : false
  end
end
