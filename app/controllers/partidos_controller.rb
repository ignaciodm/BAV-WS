class PartidosController < ApplicationController

  before_filter :find_partidos, only:[:index]

  # GET /partidos.json
  # GET /provincias/provincia_id/partidos.json
  def index
    respond_to do |format|
      format.json { render json: @partidos }
    end
  end

  # GET /partidos/1.json
  # GET /provincias/provincia_id/partidos/id.json
  def show
    partido = Partido.find(params[:id])

    respond_to do |format|
      format.json { render json: partido }
    end
  end

  private

  def find_partidos

    if params[:provincia_id]
      @partidos  = Partido.find_all_by_provincia_id(params[:provincia_id])
    else
      @partidos  = Partido.all
    end
  end

end
