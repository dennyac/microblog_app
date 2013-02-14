class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @title_app = @user.name
  end

  def new
  	@title_app = "Sign up"
  	@user = User.new
    #@user.password_digest = "dummy"
  end

  def create
    @user = User.new(params[:user])
    if @user.save
    	flash[:success] = "Welcome to the Sample App!"
      sign_in @user
      redirect_to @user
    else
      @title_app = "Sign up"
      render 'new'
    end
  end
end
