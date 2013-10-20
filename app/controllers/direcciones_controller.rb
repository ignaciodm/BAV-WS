class DireccionesController < ApplicationController
  # GET /direcciones
  # GET /direcciones.json

  before_filter :validar_usuario


  def index
    @direcciones = Direccion.find_all_by_usuario_id(params[:usuario_id])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @direcciones }
    end
  end

  # GET /direcciones/1
  # GET /direcciones/1.json
  def show
    @direccion = Direccion.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @direccion }
    end
  end

  # GET /direcciones/new
  # GET /direcciones/new.json
  def new
    @direccion = Direccion.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @direccion }
    end
  end

  # GET /direcciones/1/edit
  def edit
    @direccion = Direccion.find(params[:id])
  end

  # POST /direcciones
  # POST /direcciones.json
  def create
      params[:direccion][:usuario_id] = current_usuario.id

      format_direccion_params

      @direccion = Direccion.new(params[:direccion])

      if @direccion.save
        render 'direcciones/show'
      else
        render json: camelcase_keys_from_a_hash(@direccion.errors.messages), status: :bad_request
      end
  end

  def format_direccion_params
    params[:direccion][:entre_calle_1] = params[:entreCalle1] if params[:entreCalle1].present?
    params[:direccion][:entre_calle_2] = params[:entreCalle2] if params[:entreCalle2].present?
    params[:direccion][:localidad_id] = params[:localidadId] if params[:localidadId].present?
    params[:direccion][:comisaria_id] = params[:comisariaId] if params[:comisariaId].present?
  end

  # PUT /direcciones/1
  # PUT /direcciones/1.json
  def update
    @direccion = Direccion.find(params[:id])

    format_direccion_params

    if @direccion.update_attributes(params[:direccion])
      render 'direcciones/show'
    else
      render json: camelcase_keys_from_a_hash(@direccion.errors.messages), status: :bad_request
    end
  end

  # DELETE /direcciones/1
  # DELETE /direcciones/1.json
  def destroy
    @direccion = Direccion.find(params[:id])
    @direccion.destroy

    respond_to do |format|
      format.html { redirect_to direcciones_url }
      format.json { head :no_content }
    end
  end

  def validar_usuario
    usuario_id = (params[:usuario_id] || params[:id]).to_i
    if current_usuario.id != usuario_id
      render status: :unauthorized, text: 'El contenido al que quiere acceder no pertenece a este usuario'
    end
  end
end
