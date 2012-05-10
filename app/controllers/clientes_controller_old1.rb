class ClientesController < ApplicationController
  # GET /clientes
  # GET /clientes.json

  def index
    @clientes = Cliente.filtrar(params[:busqueda]).paginate(:per_page => 6, :page => params[:page])

     respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cliente }
      headers["Content-type"] = 'text/javascript'
      format.js
    end
  end

  # GET /clientes/1
  # GET /clientes/1.json
  def show
    @cliente = Cliente.find(params[:id])
    @l_ventas = Venta.where('cliente==? AND user==1',@cliente.id)

    @lista_ventas = []
    @l_ventas.each do |v|
      if Marca.find_by_id(v.marca).user == 1 then
        @lista_ventas << v
      end
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @cliente }
      format.js 
    end
  end

  # GET /clientes/new
  # GET /clientes/new.json
  def new
    @cliente = Cliente.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @cliente }
    end
  end

  # GET /clientes/1/edit
  def edit
    @cliente = Cliente.find(params[:id])
  end

  # POST /clientes
  # POST /clientes.json
  def create
    @cliente = Cliente.new(params[:cliente])

    respond_to do |format|
      if @cliente.save
        format.html { redirect_to @cliente, notice: 'Cliente was successfully created.' }
        format.json { render json: @cliente, status: :created, location: @cliente }
      else
        format.html { render action: "new" }
        format.json { render json: @cliente.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /clientes/1
  # PUT /clientes/1.json
  def update
    @cliente = Cliente.find(params[:id])

    respond_to do |format|
      if @cliente.update_attributes(params[:cliente])
        format.html { redirect_to @cliente, notice: 'Cliente was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @cliente.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clientes/1
  # DELETE /clientes/1.json
  def destroy
    @cliente = Cliente.find(params[:id])
    @cliente.destroy

    respond_to do |format|
      format.html { redirect_to clientes_url }
      format.json { head :ok }
    end
  end

  # EXCEL_PARSE /excel_parse
  # parseo de las columnas del excel de datos. Valores basicos de un cliente:
  # 3 - nombre 4-Codigo 16-provincia 17-Direccion 18-Localidad 19-CP 20-tlf
  # 1-cod grupo 2-nombre grupo
  ##### DATOS DE CADA CLIENTE POR CADA MARCA
  # 5 - marca
  # 14 - piezas pedidas ultimos 12 meses, 15- fecha ultim pedido
  # 6- pendientes a primeros del mes corriente, 7-facturadas mes anterior
  def excel_parse
    excel = Spreadsheet.open "clientes.xls"
    hoja = excel.worksheet 0

#    @filas = []
    hoja.each 1 do |fila|
      #solo añadimos aquellos clientes que no existan, comprobamos que el codigo no exista
      #
      ficha = Cliente.find_by_codigo( fila[4])
      if not ficha then
        ficha = Cliente.new
        ficha.user_id = 1 #usuario de test, para cuando sea MMO
        ficha.codigo = fila[4]
        ficha.nombre = fila[3]
        ficha.provincia = fila[25]
        ficha.direccion = fila[26]
        ficha.ciudad = fila[27]
        ficha.cp = fila[28]
        ficha.telefono = fila[29]
        ficha.grupo_id = fila[1]
        ficha.notas = ""
        ficha.save!
#        @filas << ficha
      end

      #parseamos la marca a la que pertenece la venta
      m = Marca.find_by_codigo( fila[10])
      if not m then
        m = Marca.new
        m.codigo = fila[10]
        m.user = 0
        m.save!
      end

      #parseamos las ventas de esa fila suponiendo que el cliente existe
      vdata = Venta.new do |v|
        v.user= 1
        v.cliente= ficha.id
        #v.marca = Marca.find_by_codigo(fila[10]).id
        v.marca =  m.id
        v.piezas_12m = fila[23]
        v.piezas_fact_last_mes = fila[12]
        v.piezas_last_pedido = fila[18]
        v.piezas_pendientes = fila[11]
      end
      vdata.save!
    end
  end
end

