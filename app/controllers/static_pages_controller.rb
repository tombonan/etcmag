class StaticPagesController < ApplicationController
	def home
		@blogs = Blog.last(4).reverse
		@articles = Issue.last.articles.last(3)
		@latestarticles = Issue.last.articles
		@disable_nav = true
		@issue = Issue.last
	end

	def login
		@disable_nav = true
		@disable_foot = true
	end

end
