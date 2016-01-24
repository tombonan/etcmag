class SessionsController < ApplicationController
  def new
  	@disable_nav = true
  	@disable_foot = true
  end

  def create
	  staff = Staff.authenticate(params[:email], params[:password])
	  if staff
	    session[:staff_id] = staff.id
	    redirect_to root_path
	  else
	    render "new"
	  end
	end

	def destroy
  		session[:staff_id] = nil
  		redirect_to root_path
	end
end
