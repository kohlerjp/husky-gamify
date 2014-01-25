class EventsController < ApplicationController

	def index
		@events = Event.all
	end

	def new
		@event = Event.new
	end

	def create
		@event = Event.new(event_params)
		start = params[:start_date]
		start_date = Date.new start["event(1i)"].to_i, start["event(2i)"].to_i, start["event(3i)"].to_i

		end_params = params[:end_date]
		end_date = Date.new end_params["event(1i)"].to_i, end_params["event(2i)"].to_i, end_params["event(3i)"].to_i


		@event.start_time = start_date
		@event.end_time = end_date
		if @event.save
			redirect_to @event
		else
			flash.now[:danger] = "Oops Something went wrong. Make sure all fields are filled in"
			render 'new'
		end
	end

	def show
		@event = Event.find(params[:id])
		
	end

	private

		def event_params
			params.require(:event).permit(:title,:points,:description,:start_time,:end_time,:location)
		end
end
