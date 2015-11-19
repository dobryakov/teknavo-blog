class UsersController < ApplicationController
  before_action :set_model, only: [:show, :edit, :update, :destroy]
  before_action :require_authorize, only: [ :update ]

  def update
    respond_to do |format|
      if @model.can_update?(current_user) && @model.update(permitted_params)
        format.html { render :nothing => true, status: :ok, layout: false }
      else
        format.html { render :nothing => true, status: :unprocessable_entity, layout: false }
      end
    end
  end

  private

  def set_model
    @model = User.find(params[:id])
  end

  def permitted_params
    params.require(:user).permit(:is_subscribed)
  end

end
