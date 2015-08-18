class Request < ActiveRecord::Base
	  enum leave_status: {Pending: "0", Approved: "1" }
	  enum leave_type: { Holiday: "0", Casual: "1" }
end