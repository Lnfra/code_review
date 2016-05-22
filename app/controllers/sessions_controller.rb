class SessionsController < ApplicationController
  def new
    if logged_in?
      redirect_to landing_url
    end
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      #If user successfully logged in redirect them to the root path and save in their flash cookie that the user is an authenticated user

      #Do not save in cookies, save in the session so that user cannot manually edit these values
      session[:user_id] = user.id
      flash[:success] = "Login successful"
      redirect_to root_url
    else
      #else show message invalid login and display new page
      flash.now[:alert] = "Invalid login details"
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "Logout successful"
    redirect_to root_url
  end
end
