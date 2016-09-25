class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Successfully logged in. Welcome back #{user.name}"
      redirect_to "/users/#{user.id}"
    else
      flash[:warning] = "Invalid username or password. Try again."
      redirect_to '/login'
    end
  end

  def destroy
    if session[:user_id]
      session[:user_id] = nil
      flash[:success] = "Successfully logged out."
      redirect_to '/login'
    else
      flash[:warning] = "You must sign in before you can sign out."
    end
  end
end
