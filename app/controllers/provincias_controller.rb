class ProvinciasController < ApplicationController
  # GET /provincias.json
  def index
    @provincias = Provincia.all

    respond_to do |format|
      format.json { render json: @provincias }
    end
  end

  # GET /provincias/1.json
  def show
    provincia = Provincia.find(params[:id])

    respond_to do |format|
      format.json { render json: provincia }
    end
  end

end
