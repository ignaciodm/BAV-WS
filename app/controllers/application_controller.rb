class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :authenticate_usuario!

  private

  def authenticate_admin_user!
    authenticate_usuario!
    unless current_usuario.admin?
      redirect_to root_path
    end
  end
end
