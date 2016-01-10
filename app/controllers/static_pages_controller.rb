class StaticPagesController < ApplicationController
	def home
		@blogs = Blog.last(4).reverse
		@disable_nav = true
	end
end
