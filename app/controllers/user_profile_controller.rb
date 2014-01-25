class UserProfileController < ApplicationController

  def new
  	@user = current_user
  end

  def create
  	@profile = current_user.build_profile(profile_params)
  	if @profile.save
  		redirect_to current_user
  	else
  		flash[:danger] = 'There was a problem creating your profile'
  		render 'new'
  	end
  end




  private
  	def profile_params
  		return params.permit(:age,:school,:power,:aboutme,),
  	end

end
