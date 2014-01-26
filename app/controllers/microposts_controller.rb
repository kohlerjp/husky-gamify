class MicropostsController < ApplicationController

	def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      redirect_to feed_url
    else
    	flash[:danger] = "Something Went Wrong"
      redirect_to feed_url
    end
  end

  def destroy
  end

  private

    def micropost_params
      params.require(:micropost).permit(:content)
    end
end
