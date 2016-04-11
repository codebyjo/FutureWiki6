class ArticlesController < ApplicationController

	before_action :find_article, only: [:show, :edit, :update, :destroy ]


	def index
		@articles = Article.all.order("created_at DESC")
	end

	def show
	end


	def new
		@article = Article.new
		## Joanne - the next line is going to break the method until you create a way for users to signup and exist in DB
#		@article = current_user.articles.build
	end

	def create
		## Joanne - the next line is going to break the method until you create a way for users to signup and exist in DB
		#  @article = current_user.article.build(article_params)
		@article = Article.create(article_params)
		if @article.save
			redirect_to @article
		else
			render 'new'
		end
	end

	private 

	def article_params
		params.require(:article).permit(:title, :content)
	end

	def find_article
		@article = Article.find(params[:id])
	end


end
