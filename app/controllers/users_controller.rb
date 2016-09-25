class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.create(name: params[:name],
                        email: params[:email],
                        password: params[:password],
                        password_confirmation: params[:password_confirmation])

    flash[:success] = "Signed up!"
    redirect_to "/users/#{@user.id}"
  end

  def show
    @user = User.find(current_user.id)
  end
end
