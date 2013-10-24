class DenunciasController < ApplicationController

  #before_filter :validar_usuario


  def index
    @denuncias = Denuncia.find_all_by_comisaria_id(params[:comisariaId])

    @denuncias = @denuncias.select { |d| d.estado == params[:estado]} if params[:estado]

    render 'denuncias/index'
  end

  def create
    format_denuncia_params

    #TODO validar usuario comun

    @denuncia = Denuncia.new(params[:denuncia])

    if @denuncia.save
      render 'denuncias/show'
    else
      render json: camelcase_keys_from_a_hash(@denuncia.errors.messages), status: :bad_request
    end
  end

  def update
    #format_denuncia_params

    #TODO validar usuario comisaria
    @denuncia = Denuncia.find(params[:id])

    if @denuncia.update_attributes(params[:denuncia])
      render 'denuncias/show'
    else
      render json: camelcase_keys_from_a_hash(@denuncia.errors.messages), status: :bad_request
    end

  end

  def format_denuncia_params
    params[:denuncia][:direccion_id] = params[:direccionId] if params[:direccionId].present?
    direccion = Direccion.find(params[:denuncia][:direccion_id])
    params[:denuncia][:comisaria_id] = direccion.comisaria.id

  end



end
