class UsuariosController < ApplicationController

  skip_before_filter :authenticate_usuario!, :only => [:create, :login]

  # GET /usuarios/id
  # GET /usuarios/1.json
  def show
    @usuario = Usuario.find(params[:id])
  end

  def update
    @usuario = Usuario.find(params[:id])

    if params[:usuario]
      params[:usuario][:fecha_de_nacimiento] = params[:fechaDeNacimiento]
    end

    if @usuario.update_attributes(params[:usuario])
      render 'usuarios/show'
    else
      render json: camelcase_keys_from_a_hash(@usuario.errors.messages), status: :bad_request
    end

  end

  def create

    if params[:usuario]
      params[:usuario][:fecha_de_nacimiento] = params[:fechaDeNacimiento]
    end

    @usuario = Usuario.new(params[:usuario])

    if @usuario.save
      @usuario
    else
      render json: camelcase_keys_from_a_hash(@usuario.errors.messages), status: :bad_request
    end
  end

  def login
    @usuario = Usuario.find_by_email(params[:email])
    raise 'Email o contrasenia invalidos' if !@usuario.valid_password?(params[:password])
    render 'usuarios/show'
  end

end
