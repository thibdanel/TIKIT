class ServicesController < ApplicationController

  def index
    @services = Service.all
  end

  def show
  end

  def edit
    @service = Service.find(params[:id])
  end

end
