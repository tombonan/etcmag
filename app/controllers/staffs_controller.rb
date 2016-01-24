class StaffsController < ApplicationController
  def new
  	@staff = Staff.new
  end

  def create
  	@staff = Staff.new(staff_params)
  	if @staff.update_attributes(staff_params)
			flash.notice = "New Staff Member Created!"
			redirect_to about_path
		else
			render 'new'
		end
  end

  private

	def staff_params
		params.require(:staff).permit(:email, :password, :password_confirmation)
	end

end
