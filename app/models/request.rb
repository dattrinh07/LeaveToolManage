class Request < ActiveRecord::Base
	  enum leave_status: { Approved: "0", Pending: "1" }
	  enum leave_type: { Holiday: "0", Casual: "1" }
end