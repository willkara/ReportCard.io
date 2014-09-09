class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @prof_comments = @user.prof_comments.all.page(params[:page]).per(10)
    @class_comments = @user.class_comments.all.page(params[:page]).per(10)


    #I want user to people to view the 'profiles' of the
#
#    unless @user == current_user
#      redirect_to :back, :alert => "Access denied."
#    end
  end

end
