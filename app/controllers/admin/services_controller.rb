class Admin::ServicesController < ApplicationController

  def index
    @service = Service.new
    @services = Service.all
  end

  def create
    @service = Service.new(service_params)
    @service.save
    redirect_to admin_services_path
  end

  def edit
    @service = Service.find(params[:id])
  end

  def update
    @service = Service.find(params[:id])
    @service.update(service_params)
    redirect_to admin_services_path
  end

  def destroy
    @service = Service.find(params[:id])
    @service.destroy
    redirect_to admin_services_path
  end


  private

  def service_params
    params.require(:service).permit(:name, :id)
  end
end
