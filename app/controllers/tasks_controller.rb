class TasksController < ApplicationController
  before_action :set_project
  before_action :find_task, only: [:show, :edit, :update]
  
  def index
    @tasks = @project.tasks.all
  end
  
  def new
    @task = @project.tasks.build
  end
  
  def create
    @task = @project.tasks.build(task_params)
    
    if @task.save
      redirect_to [@project, @task], notice: 'Task Saved'
    else
      flash.now[:alert] = 'Task not saved'
      render :new
    end
  end
  
  def show
    
  end
  
  def edit
  end
  
  def update
    if @task.update(task_params)
      redirect_to project_tasks_path(@project), notice: "Task Updated."
    else
      flash.now[:alert] = "Task not saved."
      render :edit
    end
  end
  
  private
    def set_project
      @project = Project.find(params[:project_id])
    end
    
    def task_params
      params.require(:task).permit(:name, :due_date)
    end
    
    def find_task
      @task = @project.tasks.find(params[:id])
    end
end