class GalleriesController < ApplicationController
	before_filter :load_issue

	def new
		@gallery = Gallery.new
	end

	def create
		@gallery = @issue.galleries.new(params[:id])

		if @gallery.update_attributes(gallery_params)
			flash.notice = "'#{@gallery.title}' Created!"
			redirect_to issue_article_path(@issue, @gallery)
		else
			render 'new'
		end
	end

	def show
		@gallery = Gallery.friendly.find(params[:id])
	end

	def edit
		@gallery = Gallery.friendly.find(params[:id])
	end

	def update
		@gallery = Gallery.friendly.find(params[:id])
		if @gallery.update_attributes(gallery_params)
			flash.notice = "'#{@gallery.title}' Updated!"
			redirect_to @gallery
		else
			render 'edit'
		end
	end

	def destroy
	end

	private

	def gallery_params
		params.require(:gallery).permit(:title, :author_id, :body)
	end

	def load_issue
		 @issue = Issue.friendly.find(params[:issue_id])
	end
end
