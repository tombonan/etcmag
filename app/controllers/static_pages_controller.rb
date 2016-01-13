class StaticPagesController < ApplicationController
	def home
		@blogs = Blog.last(4).reverse
		@disable_nav = true
	end

	def login
		@disable_nav = true
		@disable_foot = true
	end

end
