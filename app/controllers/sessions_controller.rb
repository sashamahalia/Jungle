class SessionsController < ApplicationController
  def new
  end

  def create
    # if the user exists AND the password is correct
    if user = User.authenticate_with_credentials(params[:email], params[:password]) 
      #Save the user id in browser cookie.
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
