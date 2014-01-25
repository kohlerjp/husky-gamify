class AttendingsController < ApplicationController

	def create
		attending = Attending.new(user_id:current_user.id,event_id:params[:event_id])
		if attending.save

			new_points = current_user.points + Event.find(params[:event_id]).points
			current_user.update_attribute(:points,new_points)
			redirect_to events_path
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
