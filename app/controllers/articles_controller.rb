class ArticlesController < ApplicationController
  def index
    @articles = Article.order('created_at DESC')
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to article_url(@article)
    else
      render :new, error: "Article creation failed."
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to article_url(@article)
    else
      render :edit, error: "Can't update Article."
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy if @article
    redirect_to :index
  end

  private

  def article_params
    params.require(:article).permit(:title, :content, :published_on)
  end
end
