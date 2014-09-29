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
    @department = Department.friendly.find(params[:id])
  end

  def update
    @department = Department.friendly.find(params[:id])
    if @department.update(department_params)
      redirect_to @department
    else
      redirect_to edit_department_path
    end
  end

  private
  def department_params
    params.require(:department).permit(:name, :description, :location)
  end
end
