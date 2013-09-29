class DireccionesController < ApplicationController
  # GET /direcciones
  # GET /direcciones.json

  before_filter :validar_usuario


  def index
    @direcciones = Direccion.all

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
      @direccion = Direccion.new(params[:direccion])

      respond_to do |format|
        if @direccion.save
          format.html { redirect_to @direccion, notice: 'Direccion was successfully created.' }
          format.json { render 'create' }
        else
          format.html { render action: "new" }
          format.json { render json: @direccion.errors, status: :unprocessable_entity }
        end
      end
  end

  # PUT /direcciones/1
  # PUT /direcciones/1.json
  def update
    @direccion = Direccion.find(params[:id])

    respond_to do |format|
      if @direccion.update_attributes(params[:direccion])
        format.html { redirectv_to @direccion, notice: 'Direccion was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @direccion.errors, status: :unprocessable_entity }
      end
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
    if current_usuario.id != params[:id].to_i
      render status: :unauthorized, text: 'El contenido al que quiere acceder no pertenece a este usuario'
    end
  end
end
