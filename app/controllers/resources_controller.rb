class ResourcesController < ApplicationController 
  before_action :find_resource, only: [:show, :edit, :update]
  
  def index
    @resources = Resource.all
  end
  
  def new
    @resource = Resource.new
  end
  
  def create
    @resource = Resource.new(resource_params)
      if @resource.save
        redirect_to @resource, notice: "Resource successfully created"
      else
        flash.now[:alert] = "Resource not saved"
        render :new
      end
  end
  
  def show
  end
  
  def edit
  end
  
  def update
    if @resource.update(resource_params)
      redirect_to @resource, notice: "Successfully updated resource name"
    else
      flash.now[:alert] = "Your resource was not updated"
      render :edit
    end
  end
  
  private
    def resource_params
      params.require(:resource).permit(:name, :description)
    end
  
    def find_resource
      @resource = Resource.find(params[:id])
    end
end