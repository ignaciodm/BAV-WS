class ProvinciasController < ApplicationController
  # GET /provincias.json
  def index
    @provincias = Provincia.all
  end

  # GET /provincias/1.json
  def show
    @provincia = Provincia.find(params[:id])
  end

end
