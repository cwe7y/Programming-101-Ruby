class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: params[:session][:email])  
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to '/'
     else
     render "login" 
    end
  end

  def destroy
    sign_out
    redirect_to sign_in_path
  end


end