class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      #If user successfully logged in redirect them to the root path and save in their flash cookie that the user is an authenticated user

      #Do not save in cookies, save in the session so that user cannot manually edit these values
      session[:user_id] = user.id
      redirect_to root_url, notice: "logged in"
    else
      #else show message invalid login and display new page
      flash.now.alert = "invalid login details"
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "logged out!"
  end
end
