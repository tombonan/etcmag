class AuthorsController < ApplicationController
	def index
		@authors = Author.all.order('name ASC')
	end

	def new
		@author = Author.new
	end

	def create
		@author = Author.new(author_params)
		if @author.update_attributes(author_params)
			flash.notice = "Author '#{@author.name}' created"
			redirect_to @author
		else
			render 'new'
		end
	end

	def edit
		@author = Author.friendly.find(params[:id])
	end

	def update
		@author = Author.friendly.find(params[:id])
		if @author.update_attributes(author_params)
			flash.notice = "Author '#{@author.name}' created"
			redirect_to @author
		else
			render 'edit'
		end
	end

	def show
		@author = Author.friendly.find(params[:id])
		@blogs = @author.blogs.order(created_at: :desc)
		@articles = @author.articles.order(created_at: :desc)
		@galleries = @author.galleries.order(created_at: :desc)
	end

private

	def author_params
		params.require(:author).permit(:name, :email, :year, :bio)
	end

end
