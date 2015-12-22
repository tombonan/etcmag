class BlogsController < ApplicationController
	def index
		@blogs = Blog.all.order(created_at: :desc)
	end

	def new
		@blog = Blog.new
	end

	def create
		@blog = Blog.new(blog_params)
		if @blog.update_attributes(blog_params)
			flash.notice = "Blog Post '#{@blog.title}' Created!"
			redirect_to @blog
		else
			render 'new'
		end
	end

	def edit
		@blog = Blog.friendly.find(params[:id])
	end

	def update
		@blog = Blog.friendly.find(params[:id])
		if @blog.update_attributes(blog_params)
			flash.notice = "Blog Post '#{@blog.title}' Updated!"
			redirect_to @blog 
		else
			render 'edit'
		end
	end

	def show
		@blog = Blog.friendly.find(params[:id])
	end

	def destroy
		
	end

	private

	def blog_params
		params.require(:blog).permit(:title, :body)
	end
end
