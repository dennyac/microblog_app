class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @title_app = @user.name
  end

  def new
  	@title_app = "Sign up"
  	@user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
    	flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end
end
