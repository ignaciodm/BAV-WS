class UsuariosController < ApplicationController

  skip_before_filter :authenticate_usuario!, :only => [:create, :login]

  # GET /usuarios/id
  # GET /usuarios/1.json
  def show
    @usuario = Usuario.find(params[:id])
  end

  def create
    puts params[:usuario].to_s
    @usuario = Usuario.new(params[:usuario])

    if @usuario.save
      @usuario
    else
      render json: @usuario.errors, status: :unprocessable_entity
    end
  end

  def login
    @usuario = Usuario.find_by_email(params[:email])
    raise 'Email o contrasenia invalidos' if !@usuario.valid_password?(params[:password])
    render 'usuarios/show'
  end

end