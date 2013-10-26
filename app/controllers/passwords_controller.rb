class PasswordsController < DeviseController
  prepend_before_filter :require_no_authentication

  respond_to :json

  # POST /resource/password
  def create
    #Formateo de parametros necesarios

    usuario = Usuario.find_by_email(params[:email])

    if usuario
      params[:usuario] = params[:password]  #No se porque no setea el scope del usuario, setea el param password asi que no asigno a mano
      self.resource = resource_class.send_reset_password_instructions(resource_params)

      if successfully_sent?(resource)
        render :json => {}, status: :ok
      else
        render :json => {error: 'No se pudo enviar el mail para cambiar el password'}, status: :internal_server_error
      end
    else
      render :json => {email: 'El email ingresado no se encuentra registrado en el sistema'}, status: :internal_server_error
    end
  end

  protected
  #def after_resetting_password_path_for(resource)
  #  after_sign_in_path_for(resource)
  #end
  #
  ## The path used after sending reset password instructions
  #def after_sending_reset_password_instructions_path_for(resource_name)
  #  new_session_path(resource_name) if is_navigational_format?
  #end
  #
  ## Check if a reset_password_token is provided in the request
  #def assert_reset_token_passed
  #  if params[:reset_password_token].blank?
  #    set_flash_message(:alert, :no_token)
  #    redirect_to new_session_path(resource_name)
  #  end
  #end
  #
  ## Check if proper Lockable module methods are present & unlock strategy
  ## allows to unlock resource on password reset
  #def unlockable?(resource)
  #  resource.respond_to?(:unlock_access!) &&
  #      resource.respond_to?(:unlock_strategy_enabled?) &&
  #      resource.unlock_strategy_enabled?(:email)
  #end
end
