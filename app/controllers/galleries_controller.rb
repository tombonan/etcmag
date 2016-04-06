class GalleriesController < ApplicationController
	before_filter :load_issue

	def new
		@gallery = Gallery.new
		@gallery_attachment = @gallery.gallery_attachments.build
	end

	def create
		@gallery = @issue.galleries.new(params[:id])

		respond_to do |format|
	    	if @gallery.update_attributes(gallery_params)
	       		params[:gallery_attachments]['avatar'].each do |b|
	          		@gallery_attachment = @gallery.gallery_attachments.create!(:avatar => b)
	       		end
	       		format.html { redirect_to issue_gallery_path(@issue, @gallery), notice: 'Gallery was successfully created.' }
	     	else
	       		format.html { render action: 'new' }
	     	end
   		end
	end

	def show
		@gallery = Gallery.friendly.find(params[:id])
		@disable_nav = true

		@gallery_attachments = @gallery.gallery_attachments.all
	end

	def edit
		@gallery = Gallery.friendly.find(params[:id])
	end

	def update
		@gallery = Gallery.friendly.find(params[:id])
		if @gallery.update_attributes(gallery_params)
			flash.notice = "'#{@gallery.title}' Updated!"
			redirect_to issue_gallery_path(@issue, @gallery)
		else
			render 'edit'
		end
	end

	def destroy
	end

	private

	def gallery_params
		params.require(:gallery).permit(:title, :author_id, :body, :photographer, gallery_attachments_attributes: [:id, :gallery_id, :avatar])
	end

	def load_issue
		 @issue = Issue.friendly.find(params[:issue_id])
	end
end
