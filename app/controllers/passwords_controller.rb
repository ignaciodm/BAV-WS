class PasswordsController < DeviseController
  prepend_before_filter :require_no_authentication

  before_filter :validar_usuario_bloqueado

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
      render :json => {email: 'El email ingresado no se encuentra registrado en el sistema'}, status: :not_found
    end
  end
end
