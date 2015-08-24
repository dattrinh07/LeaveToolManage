class Request < ActiveRecord::Base

	belongs_to :user
	has_many :comments

	has_many :holiday_types
	
	enum leave_status: {Pending: "0", Approved: "1" }
	# enum leave_type: { Holiday: "0", Casual: "1" }
end