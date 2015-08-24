class HolidayType < ActiveRecord::Base
	validates :title, presence: true
	belongs_to :request
end
