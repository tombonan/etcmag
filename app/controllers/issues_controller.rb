class IssuesController < ApplicationController
	
  	def latest
  		if Issue.all.count > 0 
    		redirect_to issue_url(Issue.last)
    	else 
    		redirect_to root_url
    	end

  	end


	def index
		@issues = Issue.all
	end

	def new
	end

	def create
	end

	def edit
	end

	def update
	end

	def destroy
	end

	private

	def issue_params
		params.require(:issue).permit(:name)
	end

end
