class StaticPagesController < ApplicationController
  def home
  	#@title_app = "Home"
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