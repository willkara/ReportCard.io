class SchoolsController < ApplicationController
  def new
  end

  def create
  end

  def index
    @schools = School.order("name").page(params[:page]).per(10)
  end

  def show
  end

  def update
  end
end
