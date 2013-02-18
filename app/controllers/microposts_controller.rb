class MicropostsController < ApplicationController

  before_filter :signed_in_user
  before_filter :correct_user,   only: :destroy
  #check whether another signed in user can manually issue a post request to create a micropost for a user
  #before_filter :correct_user 


  def create
    @micropost = current_user.microposts.build(params[:micropost])
    if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_to root_url
    else
      #Isn't it required to re-initialize @micropost before rendering static_pages/home, as form_for will require a micropost object...
      #@feed_items = []
      @feed_items = current_user.feed.paginate(page: params[:page])
      render 'static_pages/home'
    end
  end

  
  def destroy
    @micropost.destroy
    redirect_to root_url
  end  

 private

    def correct_user
      @micropost = current_user.microposts.find_by_id(params[:id])
      redirect_to root_url if @micropost.nil?
    end

end
