class UsersController < ApplicationController

  before_filter :signed_in_user, only: [:index, :edit, :update]
  before_filter :correct_user,   only: [:edit, :update]
  before_filter :admin_user,     only: :destroy

  def index
    @title_app = "All users"
    @users = User.paginate(page: params[:page]) #How does params get set??
  end

  def show
    @user = User.find(params[:id])
    @title_app = @user.name
    @microposts = @user.microposts.paginate(page: params[:page])
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

  def edit
    @title_app = "Edit user"
    # Commented as it is already present in private method correct_user
    # @user = User.find(params[:id])
  end

  def update
    # Commented as it is already present in private method correct_user
    # @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated"
      sign_in @user #remember token gets reset when the user information is updated. 
      redirect_to @user
    else
      @title_app = "Edit user"
      render 'edit'
    end
  end

  def destroy
    #if current_user.admin? && !current_user?(User.find(params[:id]))
      User.find(params[:id]).destroy
      flash[:success] = "User has been deleted"
      redirect_to users_url
    #else
    #  redirect_to root_path
    #end
  end  

  private

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end

end
