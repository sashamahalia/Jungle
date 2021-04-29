class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by email: (params[:email])
    # if the user exists AND the password is correct
    if user && user.authenticate(params[:password])
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
