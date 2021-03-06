class ArticlesController < ApplicationController
    
    before_action :set_article, only: [:update, :destroy, :edit, :show]

    def index
        @articles = Article.paginate(page: params[:page], per_page: 5)
    end
    def new
        @article = Article.new
    end

    def create
        @article = Article.new(article_params)
        if @article.save
            flash[:success] = "article was successfully created"
            redirect_to article_path(@article)
        else
            render 'new'
        end
    end
    
    def edit
        #@article = Article.find(params[:id]) 
    end
    
    def update
        #@article = Article.find(params[:id])
        
        if @article.update(article_params)
            flash[:notice] = "Article was successfukky updated"
            redirect_to article_path(@article)
        else
            render :edit
        end
    end
    
    def show
        #@article = Article.find(params[:id])    
    end
    
    def destroy
       #@article = Article.find(params[:id]) 
       @article.destroy
       redirect_to articles_path
    end
    
    private
    def set_article
       @article = Article.find(params[:id]) 
    end
    
    def article_params
        params.require(:article).permit(:title, :description)
    end
end

