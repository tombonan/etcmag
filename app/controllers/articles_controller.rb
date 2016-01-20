class ArticlesController < ApplicationController
	before_filter :load_issue

	def new
		@article = Article.new
	end

	def create
		@article = @issue.articles.new(params[:id])

		if @article.update_attributes(article_params)
			flash.notice = "'#{@article.title}' Created!"
			redirect_to issue_article_path(@issue, @article)
		else
			render 'new'
		end
	end

	def show
		@article = Article.friendly.find(params[:id])
		@disable_nav = true
	end

	def edit
		@article = Article.friendly.find(params[:id])
	end

	def update
		@article = Article.friendly.find(params[:id])
		if @article.update_attributes(article_params)
			flash.notice = "'#{@article.title}' Updated!"
			redirect_to issue_article_path(@issue, @article)
		else
			render 'edit'
		end
	end

	def destroy
	end

	private

	def article_params
		params.require(:article).permit(:title, :author_id, :body, :image)
	end

	def load_issue
		 @issue = Issue.friendly.find(params[:issue_id])
	end
end
