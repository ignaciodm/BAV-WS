class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :authenticate_usuario!

  private

  def authenticate_admin_user!
    authenticate_usuario!
    #unless current_user.admin?
    #  redirect_to companies_path
    #end
  end
end
