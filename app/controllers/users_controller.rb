class UsersController < ApplicationController
  def new
    @page_title = "Sign up!"
  end

  def create
    @user = User.create(name: params[:name],
                        email: params[:email],
                        password: params[:password],
                        password_confirmation: params[:password_confirmation])

    if @user.save
      flash[:success] = "Signed up!"
      session[:user_id] = @user.id
      redirect_to "/users/#{@user.id}"
    else
      flash[:warning] = "Invalid email or password."
      redirect_to "/signup"
    end
  end

  def show
    @user = User.find(current_user.id)
    @page_title = "#{@user.name}'s profile"
  end

  def edit
    @user = User.find(params[:id])
    @page_title = "Edit your profile"
  end

  def update
    @user = User.find(params[:id])
    @user.update(name: params[:name],
                 email: params[:email])

    redirect_to "/users/#{@user.id}"
    flash[:success] = "Profile updated"
  end

  def remote
    @user = User.find_by(email: params[:email])
  end

  def image
    @user = User.find(params[:id])
  end

  def updateimage
    @user = User.find(params[:id])
    @user.update!(avatar: params[:avatar])
    redirect_to "/users/#{@user.id}"
  end
end
