class ClassCommentsController < ApplicationController
  def index
  end

  def show
  end

  def create
    @class = RuClass.find(params[:class_id]) #this pulls specific professor by :id
    @user = User.find(params[:submitter_id])

    @class_comment = ClassComment.new
    @class_comment.user =@user
    @class_comment.ru_class =@class
    @class_comment.body=params[:class_comment][:body]
    @class_comment.save

    redirect_to ru_class_path(@class) # this will rout you to professor's show page once the comment is created.
  end


  def new
    @class_comment = ClassComment.new
  end

  private
  def class_comment_params
    params.require(:class_comment).permit(:class_title, :submitter_id, :body)
  end
end
