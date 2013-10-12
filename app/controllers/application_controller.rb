class ApplicationController < ActionController::Base
  include ApplicationHelper

  protect_from_forgery

  before_filter :authenticate_usuario!

  #skip_before_filter :verify_authenticity_token, :if => Proc.new { |c| c.request.format == 'application/json' }

  def camelcase_keys_from_a_hash(hash)
    ret = {}
    hash.each {|k, v| ret[k.to_s.camelize(:lower)] = v}
    ret
  end

  def snakecase_keys_from_params(hash)
    ret = {}
    hash.each {|k, v| ret[k.to_s.underscore] = v}
    ret
  end

  private

  def authenticate_admin_user!
    authenticate_usuario!
    unless current_usuario.admin?
      redirect_to root_path
    end
  end

  def verify_authenticity_token
    if request.format != 'application/json'
      super
    end
  end
end
