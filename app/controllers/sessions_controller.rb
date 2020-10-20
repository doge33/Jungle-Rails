class SessionsController < ApplicationController

  # remember, session doesn't have a model. We don't do Session.new
  def new
  end

  def create
    if user = User.authenticate_with_credentials(params[:email], params[:password])
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/login'
    end  
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end
end
