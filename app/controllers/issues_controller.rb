class IssuesController < ApplicationController

  	def latest
  		if Issue.all.count > 0
    		redirect_to issue_url(Issue.last)
    	else
    		redirect_to root_url
    	end
  	end


	def index
		@issues = Issue.all.order(created_at: :desc)
	end

	def new
		@issue = Issue.new
	end

	def create
		@issue = Issue.new(issue_params)
		if @issue.update_attributes(issue_params)
			flash.notice = "New Issue Created!"
			redirect_to @issue
		else
			render 'new'
		end
	end

	def show
		@issue = Issue.friendly.find(params[:id])
		@articles = @issue.articles
		@galleries = @issue.galleries
	end

	def edit
		@issue = Issue.friendly.find(params[:id])
	end

	def update
		@issue = Issue.friendly.find(params[:id])
		if @issue.update_attributes(issue_params)
			flash.notice = "#{@issue.name} Updated!"
			redirect_to @issue
		else
			render 'edit'
		end
	end

	def destroy
	end

	private

	def issue_params
		params.require(:issue).permit(:name, :image)
	end

end
