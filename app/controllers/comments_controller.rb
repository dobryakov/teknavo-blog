class CommentsController < ApplicationController
  before_action :require_authorize, only: [ :create ]

  def create
    @model = Comment.new(permitted_params.merge(user: current_user))

    respond_to do |format|
      if @model.save
        format.html { render :partial => 'shared/comment', :locals => {:comment => @model} }
      end
    end

  end

  private

  def set_model
    @model = Comment.find(params[:id])
  end

  def permitted_params
    params.require(:comment).permit(:body, :commentable_id, :commentable_type)
  end

end
