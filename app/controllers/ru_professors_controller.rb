class RuProfessorsController < ApplicationController
  def index
    @professors = RuProfessor.order("last_name").page(params[:page]).per(10)
  end

  def show
    @professor = RuProfessor.friendly.find(params[:id])

    @prof_comment =ProfComment.new
    @comments = @professor.prof_comments.order('updated_at DESC')
    @classes=@professor.ru_classes
    @department=@professor.department

  end

  def create
    @professor = RuProfessor.new(prof_params)

    if (params[:ru_professor][:department_select]).nil?
      puts 'Pop-up for department creation'
    else
      @professor.department =Department.find(params[:ru_professor][:department_select])
    end

    if (params[:ru_professor][:ru_class_select]).nil?
      puts 'Pop-up for class creation'
    else
      class_id=params[:ru_professor][:ru_class_select]
      class_id.shift
      class_id.each { |x|
        @profClassMap = ProfClassMap.new

        @class=RuClass.find(x)

        @profClassMap.ru_class=@class
        @profClassMap.ru_professor=@professor
        @profClassMap.save

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
