class UsersController < ApplicationController
  before_action :set_model, only: [:show, :edit, :update, :destroy, :unsubscribe]
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

  def unsubscribe
    user = @model
    code = unsubscribe_params[:code]
    unless user.nil?
      user.update(:is_subscribed => false) if user.unsubscribe_code.to_s == code.to_s
    end
    redirect_to root_path
  end

  private

  def set_model
    @model = User.find(params[:id])
  end

  def permitted_params
    params.require(:user).permit(:is_subscribed)
  end

  def unsubscribe_params
    params.permit(:id, :code)
  end

end
