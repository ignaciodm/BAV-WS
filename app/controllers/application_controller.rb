#encoding: utf-8

module Devise::Controllers::Helpers
  #Monkey Patching devise_controller? methods.
  # A veces en tiempo de ejecucion un controller que heredaba de DeviseController pasa a heredar de otro
  # DeviseController que no es el mismo y se vuelvo loco
  def devise_controller?
    is_a?(DeviseController) || self.class.to_s.starts_with?("ActiveAdmin::")
  end
end

class UsuarioBloqueadoException < Exception

  def to_s
    "El usuario fue bloqueado por una comisaría, y no puede hacer uso de la aplicación. Verifique su cuenta de email para más información."
  end

end

class ApplicationController < ActionController::Base
  include ApplicationHelper

  protect_from_forgery

  before_filter :authenticate_usuario! #, :unless => :active_admin_controller? #Condition added to identify if a redirect loop ocurrs in production environment

  rescue_from UsuarioBloqueadoException, with: :usuario_bloqueado_comisaria_response

  #skip_before_filter :verify_authenticity_token, :if => Proc.new { |c| c.request.format == 'application/json' }
  #
  #def active_admin_controller?
  #  if !self.kind_of?(DeviseController) &&
  #    (self.class.to_s.starts_with?("ActiveAdmin::") || self.kind_of?(SessionsController))
  #    logger.error("Infinite Redirect Loop")
  #  end
  #
  #  ( self.class.to_s.starts_with?("ActiveAdmin::")) ||
  #  (self.kind_of?(SessionsController) && (self.action_name == 'login'))
  #end

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

  protected

  def usuario_bloqueado_comisaria_response(exception)
    render json: exception.message, status: :forbidden
  end

  def validar_usuario_bloqueado
    if current_usuario && current_usuario.bloqueado_comisaria
      raise UsuarioBloqueadoException
    end
  end

  def authenticate_admin_user!
    authenticate_usuario!
    if !current_usuario.admin? && !current_usuario.is_comisaria?
      redirect_to root_path
    end
  end

  def verify_authenticity_token
    if request.format != 'application/json'
      super
    end
  end
end
