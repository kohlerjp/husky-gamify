class AttendingsController < ApplicationController

	def create
		attending = Attending.new(attending_params)
		if attending.save
			redirect_to events: params[:event_id]
		else
			flash[:danger] = "There was an error"
			redirect_to current_user
		end
	end
	private

	def attending_params
		params.require(:attending).permit(:event_id,:user_id)
	end
end
