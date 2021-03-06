class UsuariosController < ApplicationController

  skip_before_filter :authenticate_usuario!, :only => [:create]

  before_filter :validar_usuario_bloqueado

  def index
    @usuarios = Usuario.all

    if params[:comisariaId]
      @usuarios = @usuarios.select do |u|
        u.direcciones.any? {|d| d.comisaria_id == params[:comisariaId].to_i}
      end
    end

    if params[:bloqueadoComisaria]
      bloqueado = params[:bloqueadoComisaria] == 'true'
      @usuarios = @usuarios.select { |u| u.bloqueado_comisaria == bloqueado}
    end

    render 'usuarios/index'
  end

  # GET /usuarios/id
  # GET /usuarios/1.json
  def show
    @usuario = Usuario.find(params[:id])
  end

  def bloqueo
    @usuario = Usuario.find(params[:id])

    begin
      @usuario.blocked_in_comisaria!
      render 'usuarios/show'
    rescue => e
      logger.error(e.message)
      render json: {error: e.message}, status: :internal_server_error
    end

  end

  def desbloqueo
    @usuario = Usuario.find(params[:id])

    begin
      @usuario.unblocked_in_comisaria!
      render 'usuarios/show'
    rescue => e
      logger.error(e.message)
      render json: {error: e.message}, status: :internal_server_error
    end

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

  def validar_password
    @usuario = Usuario.find(params[:id])

    if !@usuario || !@usuario.valid_password?(params[:password])
      render json: {password: 'Contrasenia invalidos'}, status: :internal_server_error
    else
      render 'usuarios/show'
    end

  end

  def actualizar_password
    @usuario = Usuario.find(params[:id])

    if !@usuario
      render json: {usuario: 'El usuario no existe'}, status: :not_found
    elsif !@usuario.valid_password?(params[:password])
      render json: {password: 'Password incorrecto.'}, status: :bad_request
      else

        if params[:nuevaPassword].blank?
          render json: { nuevaPassword: 'El nuevo password no puede ser vacio'}, status: :bad_request
        elsif params[:nuevaPasswordConfirmacion].blank?
          render json: { nuevaPasswordConfirmacion: 'La confirmacion del nuevo password no puede ser vacio' }, status: :bad_request
        elsif params[:nuevaPassword] != params[:nuevaPasswordConfirmacion]
          render json: { nuevaPassword: 'El nuevo password y la confirmacion no coinciden',
                         nuevaPasswordConfirmacion: 'El nuevo password y la confirmacion no coinciden'}, status: :bad_request
        else
          @usuario.password = params[:nuevaPassword]
          if @usuario.save
            render 'usuarios/show'
          else
            render json: camelcase_keys_from_a_hash(@usuario.errors.messages), status: :bad_request
          end
        end

      end

  end

  def destroy
    @usuario = Usuario.find(params[:id])
    @usuario.destroy

    render 'usuarios/show'
  end
end
