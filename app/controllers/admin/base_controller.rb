class Admin::BaseController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin

  private

  def authenticate_admin
    unless current_user.is_admin?
      flash[:alert] = "Now Allow"

      redirect_to root_path
    end
  end
end
