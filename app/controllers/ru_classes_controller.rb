class RuClassesController < ApplicationController
  def index
    @classes = RuClass.order("class_title").page(params[:page]).per(10)
  end

  def show
    @class = RuClass.find(params[:id])
    @class_comment =ClassComment.new
    @comments = @class.class_comments.order('updated_at DESC')
    @professors = @class.ru_professors
    @departments = @class.department

  end

  def create
    @class = RuClass.new(class_params)
    @class.department =Department.find(params[:ru_class][:department_select])
    puts "HELLO"

    if (!params[:ru_class][:ru_class_select].nil?)
      STDOUT.puts "IM INSIDE"
      prof_id=params[:ru_class][:ru_professor_select]
      prof_id.shift
      prof_id.each { |x|
        @pcmapper = ProfClassMap.new

        @prof=RuProfessor.find(x)

        @pcmapper.ru_class=@class
        @pcmapper.ru_professor=@prof
        @pcmapper.save

      }

    end


    if @class.save
      redirect_to @class
    else
      render 'new'
    end
  end

  def new
    @class = RuClass.new
  end

  def update
  end

  private
  def class_params
    params.require(:ru_class).permit(:class_title, :class_code, :class_synopsis)
  end
end
