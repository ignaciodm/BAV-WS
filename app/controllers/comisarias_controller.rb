class ComisariasController < ApplicationController

 before_filter :validar_usuario , :except => [:index]

  # GET /comisarias
  # GET /comisarias.json
  def index
    @comisarias = Comisaria.all
  end

  # GET /comisarias/1
  # GET /comisarias/1.json
  def show
    @comisaria = Comisaria.find(params[:id])
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
   params[:comisaria][:usuario_id] = current_usuario.id
   format_comisaria_params

   @comisaria = Comisaria.new(params[:comisaria])

   if @comisaria.save
     render 'comisarias/show'
   else
     render json: camelcase_keys_from_a_hash(@comisaria.errors.messages), status: :bad_request
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

  def format_comisaria_params
    params[:comisaria][:localidad_ids] = params[:localidadIds] if params[:localidadIds].present?
  end

  def validar_usuario
    usuario_id = (params[:usuario_id] || params[:id]).to_i
    if current_usuario.id != usuario_id
      render json: 'El contenido al que quiere acceder no pertenece a este usuario', :status =>:unauthorized
    end

    if !current_usuario.comisaria?
      render json: 'El usuario no tiene permisos de comisaria', :status => :unauthorized
    end

  end

end
