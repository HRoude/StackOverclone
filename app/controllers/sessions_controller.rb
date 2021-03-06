class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      flash[:success] = "Success! Logged in as #{user.username}."
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash[:danger] = "You have entered an incorrect username/password combination. Please try again."
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
