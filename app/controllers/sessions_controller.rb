class SessionsController < ApplicationController
  skip_before_action :redirect_if_not_logged_in
  
  def index 
  end 

  def new
    # @user = User.find_by(username: params[:user][:username])
    # if @user && @user.authenticate(params[:user][:password]) 
    #   session[:user_id] = @user.id
    #   redirect_to user_path(@user)
    # else 
    #   flash[:message] = "Sorry, please try again"
    #   redirect_to login_path
    #   end 
    end 

  def create
    @user = User.find_by(username: params[:user][:username])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:error] = "Sorry, login info was incorrect. Please try again."
      redirect_to login_path
    end
  end 

  def home
  end 

  def destroy
    session.delete(:user_id)
    redirect_to '/'
  end 

  private 
end
