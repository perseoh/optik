class TareasController < ApplicationController
  # GET /tareas
  # GET /tareas.json
  def index
    @tareas = Tarea.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tareas }
      format.js {}
    end
  end

  # GET /tareas/1
  # GET /tareas/1.json
  def show
    @tarea = Tarea.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tarea }
      format.js {redirect_to :controller => "clientes", :action =>"show", :id => @tarea.cliente, :format => :js }

    end
  end

  # GET /tareas/new
  # GET /tareas/new.json
  def new
    @tarea = Tarea.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tarea }
    end
  end

  # GET /tareas/1/edit
  def edit
    @tarea = Tarea.find(params[:id])
  end

  # POST /tareas
  # POST /tareas.json
  def create
    @tarea = Tarea.new( :texto => params[:texto],
                        :cliente_id => params[:cliente_id].to_i,
                        :user_id => params[:user_id].to_i,
                        :fecha => params[:fecha],
                        :estado => params[:estado]
                      )

    respond_to do |format|
      if @tarea.save
        format.html { }
        format.json { render json: @tarea, status: :created, location: @tarea }
        format.js {redirect_to :controller => "clientes", :action =>"show", :id => @tarea.cliente_id, :format => :js }
      else
        format.html { render action: "new" }
        format.json { render json: @tarea.errors, status: :unprocessable_entity }
        format.js {}
      end
    end
  end

  # PUT /tareas/1
  # PUT /tareas/1.json
  def update
    @tarea = Tarea.find(params[:id])

    respond_to do |format|
      if @tarea.update_attributes(params[:tarea])
        format.html { redirect_to @tarea, notice: 'Tarea was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @tarea.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tareas/1
  # DELETE /tareas/1.json
  def destroy
    @tarea = Tarea.find(params[:id])
    @tarea.destroy

    respond_to do |format|
      format.html { redirect_to tareas_url }
      format.json { head :ok }
      format.js { 
        redirect_to "/mostrar_cliente/#{@tarea.cliente_id}", :format => :js
      }
    end
  end
end
