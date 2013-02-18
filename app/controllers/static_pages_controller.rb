class StaticPagesController < ApplicationController
  def home
  	#@title_app = "Home"
    if signed_in?
      @micropost  = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
    #@micropost = current_user.microposts.build if signed_in?
  end

  def help
  	@title_app = "Help"
  end
  
  def about
  	@title_app = "About Us"
  end

  def contact
  	@title_app = "Contact"
  end
  
end
