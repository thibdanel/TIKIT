class ServiceTasksController < ApplicationController
  def index
    @service_tasks = Service_task.all
  end

  def new
    @service_task = Service_task.new
  end

  def create
  end
end
