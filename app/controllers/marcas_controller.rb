class MarcasController < ApplicationController
  # GET /marcas
  # GET /marcas.json
  def index
    @marcas = Marca.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @marcas }
    end
  end

  # GET /marcas/1
  # GET /marcas/1.json
  def show
    @marca = Marca.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @marca }
    end
  end

  # GET /marcas/new
  # GET /marcas/new.json
  def new
    @marca = Marca.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @marca }
    end
  end

  # GET /marcas/1/edit
  def edit
    @marca = Marca.find(params[:id])
  end

  # POST /marcas
  # POST /marcas.json
  def create
    @marca = Marca.new(params[:marca])

    respond_to do |format|
      if @marca.save
        format.html { redirect_to @marca, notice: 'Marca was successfully created.' }
        format.json { render json: @marca, status: :created, location: @marca }
      else
        format.html { render action: "new" }
        format.json { render json: @marca.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /marcas/1
  # PUT /marcas/1.json
  def update
    @marca = Marca.find(params[:id])

    respond_to do |format|
      if @marca.update_attributes(params[:marca])
        format.html { redirect_to @marca, notice: 'Marca was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @marca.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /marcas/1
  # DELETE /marcas/1.json
  def destroy
    @marca = Marca.find(params[:id])
    @marca.destroy

    respond_to do |format|
      format.html { redirect_to marcas_url }
      format.json { head :ok }
    end
  end
end
