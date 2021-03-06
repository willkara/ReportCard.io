class SchoolsController < ApplicationController
  def new
    @school = School.new
  end

  def create
    @school = School.new(school_params)


    if @school.save
      redirect_to @school
    else
      render 'new'
    end
  end

  def index
    @schools = School.order("name").page(params[:page]).per(10)
  end

  def show
    @school = School.friendly.find(params[:id])
  end

  def edit
    @school = School.friendly.find(params[:id])
  end

  def update
    @school = School.friendly.find(params[:id])
    if @school.update(school_params)
      redirect_to @school
    else
      redirect_to edit_school_path
    end
  end


  private
  def school_params
    params.require(:school).permit(:name, :summary, :website, :address, :phone)
  end
end
