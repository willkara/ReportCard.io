class RuProfessorsController < ApplicationController
  def index
    @professors = RuProfessor.order("last_name").page(params[:page]).per(10)
  end

  def show
    @professor = RuProfessor.find(params[:id])
    @prof_comment =ProfComment.new
    @comments = @professor.prof_comments.order('updated_at DESC')
    @classes=@professor.ru_classes
    @department=@professor.department
  end

  def create
    @professor = RuProfessor.new(prof_params)

    @professor.department =Department.find(params[:ru_professor][:department_select])


    if(!params[:ru_professor][:ru_class_select].nil?)
    class_id=params[:ru_professor][:ru_class_select]
    class_id.shift
    class_id.each { |x|
      @pcmapper = ProfClassMap.new

      @class=RuClass.find(x)

      @pcmapper.ru_class=@class
      @pcmapper.ru_professor=@professor
      @pcmapper.save

    }
    end

    if @professor.save
      redirect_to @professor
    else
      render 'new'
    end
  end

  def new
    @professor = RuProfessor.new
  end

  def update
  end

  private
  def prof_params
    params.require(:ru_professor).permit(:first_name, :last_name, :email, :department)
  end
end
