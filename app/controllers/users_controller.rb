class UsersController < ApplicationController
  before_action :signed_in_user, only: [:new, :create]

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
      sign_in @user
  		redirect_to create_profile_path
  	else
  		render 'new'
  	end
  end

  def show
  	@user = User.find(params[:id])
  end

  def index
    @users = User.all
  end

  private

  	def user_params
  		return params.require(:user).permit(:name,:email,:password,:password_confirmation)
  	end


end
