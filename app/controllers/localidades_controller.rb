class LocalidadesController < ApplicationController
  # GET /localidades.json
  # GET /provincia/provincia_id/partidos/partido_id/localidades.json

  before_filter :find_localidades, only:[:index]

  def index
  end

  # GET /provincia/provincia_id/partidos/partido_id/localidades.json
  # GET /localidades/1.json
  def show
    @localidad = Localidad.find(params[:id])
  end

  def comisarias
    @localidad = Localidad.find(params[:id])

    respond_to do |format|
      format.json { render json: @localidad.comisarias }
    end

  end

  private

  def find_localidades
    if params[:partido_id]
      @localidades = Localidad.find_all_by_partido_id(params[:partido_id])
    else
      @localidades = Localidad.all
    end
  end

end
