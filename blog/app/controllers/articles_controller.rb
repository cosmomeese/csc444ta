class ArticlesController < ApplicationController

	#require user/pass for every action except index & show
	http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show] 

	def index
		@articles = Article.all
	end
	
	def show
		@article = Article.find(params[:id])
	end
	
	def new
		@article = Article.new #updated version - post validation
	end
	
	def edit
		@article = Article.find(params[:id])
	end
	
	def create
		# render plain: params[:article].inspect  # first version
		# @article = Article.new(params.require(:article).permit(:title, :text))  # second version
		@article = Article.new(article_params)  # third version
		
		#@article.save  # initial version
		#redirect_to @article  # initial version
		
		if @article.save  # updated version - post validation
			redirect_to @article
		else
			render 'new'
		end
	end
	
	def update
		@article = Article.find(params[:id])
		
		if @article.update(article_params)
			redirect_to @article
		else
			render 'edit'
		end
	end
	
	def destroy
		@article = Article.find(params[:id])
		@article.destroy
		
		redirect_to articles_path
	end
	
	private # after declaring private visibility anything below --v will be private
		def article_params
			params.require(:article).permit(:title, :text)
		end
end
