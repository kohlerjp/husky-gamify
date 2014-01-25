class GenericPagesController < ApplicationController
  before_action :signed_in_user, only: [:home]

  def home
  end

  def about
  end

  def faq
  end
end
