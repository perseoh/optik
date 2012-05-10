class CitasController < ApplicationController
  # GET /citas
  # GET /citas.json
  def index
    @citas = Cita.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @citas }
    end
  end

  # GET /citas/1
  # GET /citas/1.json
  def show
    @cita = Cita.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @cita }
    end
  end

  # GET /citas/new
  # GET /citas/new.json
  def new
    @cita = Cita.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @cita }
    end
  end

  # GET /citas/1/edit
  def edit
    @cita = Cita.find(params[:id])
  end

  # POST /citas
  # POST /citas.json
  def create
    @cita = Cita.new(:texto => params[:texto],
                      :cliente_id => params[:cliente_id].to_i,
                      :user_id => params[:user_id].to_i,
                      :fecha => params[:fecha]
                    )

    respond_to do |format|
      if @cita.save
        format.html { redirect_to @cita, notice: 'Cita was successfully created.' }
        format.json { render json: @cita, status: :created, location: @cita }
        format.js {redirect_to :controller => "clientes", :action =>"show", :id => @cita.cliente_id, :format => :js }
      else
        format.html { render action: "new" }
        format.json { render json: @cita.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /citas/1
  # PUT /citas/1.json
  def update
    @cita = Cita.find(params[:id])

    respond_to do |format|
      if @cita.update_attributes(params[:cita])
        format.html { redirect_to @cita, notice: 'Cita was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @cita.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /citas/1
  # DELETE /citas/1.json
  def destroy
    @cita = Cita.find(params[:id])
    @cita.destroy

    respond_to do |format|
      format.html { redirect_to citas_url }
      format.json { head :ok }
      format.js { redirect_to "/mostrar_cliente/#{@cita.cliente_id}", :format => :js }
    end
  end
end
