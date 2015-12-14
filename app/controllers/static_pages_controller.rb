class StaticPagesController < ApplicationController
	def home
		@blogs = Blog.last(4).reverse
	end
end
