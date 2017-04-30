class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
  @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end


  def edit
  @article = Article.find(params[:id])
  end

  #this is when a 'new' article gets submitted
  def create
    @article = Article.new(article_params)

    #if the article gets saved, go to the article/id, otherwise reload the "new" page
    if @article.save
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

  private
    def article_params
      params.require(:article).permit(:title, :text)
    end
end
