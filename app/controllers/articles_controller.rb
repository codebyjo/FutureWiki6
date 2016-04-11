class ArticlesController < ApplicationController

	before_action :find_article, only: [:show]



	def index
		@articles = Article.all.order("created_at DESC")
	end

	def show
	end


	def new
		@article = Article.new
		#@article = current_user.articles.build
	end

	def create
		@article = current_user.articles.build(article_params)
		if @article.save
			redirect_to @article
		else
			render 'new'
		end
	end

	private 

	def article_params
		params.require(:article).permit(:title, :content, :id)
	end

	def find_article
		@article = Article.find(params[:id])
	end


end
