class ComisariasController < ApplicationController
  # GET /comisarias
  # GET /comisarias.json
  def index
    @comisarias = Comisaria.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @comisarias }
    end
  end

  # GET /comisarias/1
  # GET /comisarias/1.json
  def show
    @comisaria = Comisaria.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @comisaria }
    end
  end

  # GET /comisarias/new
  # GET /comisarias/new.json
  def new
    @comisaria = Comisaria.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @comisaria }
    end
  end

  # GET /comisarias/1/edit
  def edit
    @comisaria = Comisaria.find(params[:id])
  end

  # POST /comisarias
  # POST /comisarias.json
  def create
    @comisaria = Comisaria.new(params[:comisaria])

    respond_to do |format|
      if @comisaria.save
        format.html { redirect_to @comisaria, notice: 'Comisaria was successfully created.' }
        format.json { render json: @comisaria, status: :created, location: @comisaria }
      else
        format.html { render action: "new" }
        format.json { render json: @comisaria.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /comisarias/1
  # PUT /comisarias/1.json
  def update
    @comisaria = Comisaria.find(params[:id])

    respond_to do |format|
      if @comisaria.update_attributes(params[:comisaria])
        format.html { redirect_to @comisaria, notice: 'Comisaria was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @comisaria.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comisarias/1
  # DELETE /comisarias/1.json
  def destroy
    @comisaria = Comisaria.find(params[:id])
    @comisaria.destroy

    respond_to do |format|
      format.html { redirect_to comisarias_url }
      format.json { head :no_content }
    end
  end
end
