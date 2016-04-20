class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index]
  def index
  @users = User.all
  end

  def show
  @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to sign_in_path
    else
      render :new
    end
  end

  def user_params
    params.require(:user).permit(:first_name,:last_name,:email, :password, :password_confirmation)
  end

  def sign_in_user
    unless signed_in?
      redirect_to sign_in_path
    end
  end

end
