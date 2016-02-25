class ProjectsController < ApplicationController
  before_action :find_project, only: [:show, :update, :edit]
  
  def index
    @projects = Project.all
  end
  
  def new
    @project = Project.new
  end
  
  def create
    @project = Project.new(project_params)
      if @project.save
        redirect_to @project, notice: "Project successfully created"
      else
        render :new
      end
  end
  
  def show
    @tasks = @project.tasks.all
    @resources = @project.resources.all
  end
  
  def edit
  end
  
  def update
    if @project.update(project_params)
      redirect_to @project, notice: "Project successfully updated"
    else
      render :edit
    end
  end
  
  
  private
    def find_project
      @project = Project.find(params[:id])
    end
  
    def project_params
      params.require(:project).permit(:name, :description, :start_date, :projected_end_date, :actual_end_date, :budget, :cost)
    end
    
end