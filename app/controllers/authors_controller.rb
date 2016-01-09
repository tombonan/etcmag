class AuthorsController < ApplicationController
	def index
		
	end

	def new
		
	end

	def create
		
	end

	def edit
		@author = Author.friendly.find(params[:id])
	end

	def update
		
	end

	def show
		@author = Author.friendly.find(params[:id])
		@blogs = @author.blogs.order(created_at: :desc)
	end

private

	def author_params
		params.require(:author).permit(:name, :email, :year, :bio)
	end


end
