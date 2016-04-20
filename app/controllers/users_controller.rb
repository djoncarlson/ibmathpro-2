class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_user

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to :root, :alert => "Access denied"
    end
  end
private
  def admin?
    current_user.admin
  end

  def admin_user
    unless current_user.admin?
      redirect_to root_path
      flash[:error] = "Not authorized"
    end
  end
end
