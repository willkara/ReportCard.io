class ProfCommentsController < ApplicationController
  def index
  end

  def show
  end

  def create
    @professor = RuProfessor.find(params[:professor_id]) #this pulls specific professor by :id
    @user = User.find(params[:submitter_id])

    @prof_comment = ProfComment.new
    @prof_comment.user =@user
    @prof_comment.ru_professor =@professor
    @prof_comment.body=params[:prof_comment][:body]
    @prof_comment.save

    redirect_to ru_professor_path(@professor) # this will rout you to professor's show page once the comment is created.
  end


  def new
    @prof_comment = ProfComment.new
  end

  private
  def prof_comment_params
    params.require(:prof_comment).permit(:professor_id, :submitter_id, :body)
  end
end
