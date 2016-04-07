class ArticlesController < ApplicationController
	before_filter :load_issue

	def new
		@article = Article.new
		@article_attachment = @article.article_attachments.build
	end

	def create
		@article = @issue.articles.new(params[:id])

		respond_to do |format|
	    	if @article.update_attributes(article_params)
	       		params[:article_attachments]['avatar'].each do |b|
	          		@article_attachment = @article.article_attachments.create!(:avatar => b)
	       		end
	       		format.html { redirect_to issue_article_path(@issue, @article), notice: 'Article was successfully created.' }
	     	else
	       		format.html { render action: 'new' }
	     	end
   		end
	end

	def show
		@article = Article.friendly.find(params[:id])
		@disable_nav = true

		@article_attachments = @article.article_attachments.all
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
		params.require(:article).permit(:title, :author_id, :body, :photographer, article_attachments_attributes: [:id, :article_id, :avatar])
	end

	def load_issue
		 @issue = Issue.friendly.find(params[:issue_id])
	end
end
