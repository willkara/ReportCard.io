class DepartmentsController < ApplicationController
  def index
    @departments = Department.order("name").page(params[:page]).per(10)
  end

  def show
    @department = Department.friendly.find(params[:id])
    @classlist= @department.ru_classes
    @proflist = @department.ru_professors
  end

  def create
    @department = Department.new(department_params)
    @school = School.find_by_name(params[:school_id])

    @department.school =@school

    if @department.save
      redirect_to @department
    else
      render 'new'
    end
  end

  def new
    @department = Department.new
  end

  def edit
  end

  private
  def department_params
    params.require(:department).permit(:name, :description, :location)
  end
end
