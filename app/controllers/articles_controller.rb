class ArticlesController < ApplicationController
  
  def new
    @article = Article.new
  end
  
  def create
    #render plain: params[:article].inspect, // it is used to display the submitted text
    @article = Article.new(article_params)
    @article.save
    redirect_to articles_show(@article)
  end
  
  private
    def article_params
    params.require(:article).permit(:title, :description)  
    end
end