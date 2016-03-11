class AssignmentsController < ApplicationController
  before_action :find_assignment, only: [:edit, :update, :show]
  
  def new
    @assignment = Assignment.new
  end
  
  def create
     @assignment = Assignment.new(assignment_params)
    if @assignment.save
      redirect_to @assignment, notice: 'Assignment successfully created.'
    else
      flash.now[:alert] = 'Assignment was not created.'
      render :new
    end
  end
  
  def show
  end
  
  def edit
  end
  
  def update
    if @assignment.update(assignment_params)
      redirect_to assignment_path(@assignment), notice: 'Assignment successfully updated.'
    else
      flash.now[:alert] = 'Assignment was not saved.'
      render :edit
    end
  end
  
  private
    def find_assignment
      @assignment = Assignment.find(params[:id])
    end
    
    def assignment_params
      params.require(:assignment).permit(:project_id, :resource_id, :start_date, :end_date)
    end
end