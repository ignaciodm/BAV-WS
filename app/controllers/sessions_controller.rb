
class SessionsController < DeviseController
  prepend_before_filter :require_no_authentication, :only => [:login ]
  prepend_before_filter :allow_params_authentication!, :only => :login


  respond_to :json

  def login
    #Formateo de parametros necesarios
    params[:usuario] = params[:session]  #No se porque no setea el scope del usuario, setea el param session asi que no asigno a mano
    params[:usuario].merge!(remember_me: 1)

    self.resource = warden.authenticate(auth_options)

    if self.resource
      set_flash_message(:notice, :signed_in) if is_navigational_format?
      sign_in(resource_name, resource)
      render 'usuarios/show'
    else
      @usuario = Usuario.find_by_email(params[:email])
      render 'usuarios/show', status: :bad_request
    end
    #Srespond_with resource, :location => after_sign_in_path_for(resource)
  end

  protected

  def auth_options
    { :scope => resource_name, :recall => "#{controller_path}#new" }
  end

  def invalid_login_attempt
    warden.custom_failure!
    render :json=> {:success=>false, :message=>"Error with your login or password"}, :status=>401
  end
end