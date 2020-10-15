class SessionsController < ApplicationController

  # remember, session doesn't have a model. We don't do Session.new
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    # if user exists AND the password entered is correct
    if user && user.authenticate(params[:password])
      #Save the user id inside the browser cookie. 
      session[:user_id] = user.id
      redirect_to '/'
    else
      # If user's login doesn't work, go backt o login form
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end
end
