class ArticlesController < ApplicationController
  before_action :set_model, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all.reverse_ordered
  end

  def show
    @article = @model
  end

  private

  def set_model
    @model = Article.find(params[:id])
  end

  def permitted_params
    params.require(:article).permit(:body)
  end

end
