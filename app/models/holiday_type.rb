class HolidayType < ActiveRecord::Base
	validates :title, presence: true
end
