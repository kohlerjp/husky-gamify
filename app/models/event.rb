class Event < ActiveRecord::Base
	default_scope -> { order('start_time DESC') }
end
