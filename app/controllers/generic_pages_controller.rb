class GenericPagesController < ApplicationController
  before_action :signed_in_user, only: [:home]

  def home
  end

  def about
  end

  def faq
  end

  def logged_in_home
    @events = Event.where('id > 0',limit:4)
    @micropost = current_user.microposts.build
    @posts = Micropost.limit(4).where('id > 0')
  	
  end
end
