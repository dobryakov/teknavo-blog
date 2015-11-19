class ArticlesController < ApplicationController
  before_action :set_model, only: [:show, :edit, :update, :destroy]
  before_action :require_authorize, only: [ :create ]

  def create
    @model = Article.new(permitted_params.merge(user: current_user))

    respond_to do |format|
      if @model.save
        format.html { render :partial => 'shared/article', :locals => {:article => @model} }
      end
    end

  end

  def index
    @articles = Article.all.ordered
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
