class SessionsController < ApplicationController
	before_action :signed_in_user, only: [:new, :create]
  def new
  end

  def create
  	user = User.find_by(email: params[:session][:email].downcase)
  	if user && user.authenticate(params[:session][:password])
  		sign_in user
  		redirect_to feed_url
  	else
  		flash.now[:danger] = "Invalid email/password combination"
  		render 'new'
  	end
  end

  def destroy
  	sign_out
  	redirect_to root_url
  end
end
