class Event < ActiveRecord::Base
	default_scope -> { order('start_time ASC') }
	has_many :attendings
	has_many :users, through: :attendings

	validates :title, presence: true
	validates :points, presence: true
	validates :location, presence: true
	validates :description, presence: true
	validates :start_time, presence: true
	validates :end_time, presence: true
end
