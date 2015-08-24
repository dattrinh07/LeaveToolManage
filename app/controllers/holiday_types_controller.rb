class HolidayTypesController < ApplicationController

	def index
		@holidays = HolidayType.all
		@holidaytype = HolidayType.new
	end

	def new
		@holidaytype = HolidayType.new
	end

	def create
		@holiday = HolidayType.new(holiday_params)

		if @holiday.save
			respond_to do |format|
		    	#format.html {redirect_to holiday_types_path}
		    	format.js
		    end
		end
	end

	def edit
		@holidaytype = HolidayType.find(params[:id])
		respond_to do |format|
			format.html
			format.js
		end
	end

	def update
		@holiday = HolidayType.find(params[:id])

		if @holiday.update(holiday_params)
			redirect_to holiday_types_path
		else
			render 'edit'
		end
	end

	def destroy
		@holiday = HolidayType.find(params[:id])
		@holiday.destroy

		redirect_to holiday_types_path
	end

	private
	def holiday_params
		params.require(:holiday_type).permit(:title, :description)
	end
end