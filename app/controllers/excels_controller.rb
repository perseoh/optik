class ExcelsController < ApplicationController
  # GET /clientes
  # GET /clientes.json

  def index

    @excels = Excel.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cliente }
      format.js
    end
  end
    

  # GET /excel/new   
  def new
    @nuevo_excel = Excel.new

    respond_to do |format|
      format.html
    end

  end

  def destroy
    @xls = Excel.find(params[:id])
    @xls.destroy

    # Mostrar algo al destruir archivo
  end

  # EXCEL_PARSE /excel/parse
  # parseo de las columnas del excel de datos. Valores basicos de un cliente:
  # 3 - nombre 4-Codigo 16-provincia 17-Direccion 18-Localidad 19-CP 20-tlf
  # 1-cod grupo 2-nombre grupo
  ##### DATOS DE CADA CLIENTE POR CADA MARCA
  # 5 - marca
  # 14 - piezas pedidas ultimos 12 meses, 15- fecha ultim pedido
  # 6- pendientes a primeros del mes corriente, 7-facturadas mes anterior
  def parse
    excel = Spreadsheet.open "clientes.xls"
    hoja = excel.worksheet 0

    hoja.each 1 do |fila|
      #solo añadimos aquellos clientes que no existan, comprobamos que el codigo no exista
      #
      if fila[1] then #chequea que haya nombre y no sea una fila vacia
        ficha = Cliente.find_by_codigo( fila[3])
        if not ficha then
          ficha = Cliente.new
          ficha.user_id = 1 #usuario de test, para cuando sea MMO
          ficha.codigo = fila[3]
          ficha.nombre = fila[1]
          ficha.provincia = fila[18]
          ficha.direccion = fila[19]
          ficha.ciudad = fila[20]
          ficha.cp = fila[21]
          ficha.telefono = fila[22]
          ficha.grupo_id = 1 # !!!!!!! AÑADIR GRUPOS MAS TARDE, PONGO 1 POR IR PONIENDO ALGO
          ficha.notas = ""
          ficha.save!
        end

        #parseamos la marca a la que pertenece la venta
        m = Marca.find_by_codigo( fila[6])
        if not m then
          m = Marca.new
          m.codigo = fila[6]
          m.user_id = 1
          m.save!
        end

        #parseamos las ventas de esa fila suponiendo que el cliente existe
        vdata = Venta.new do |v|
          v.user_id= 1
          v.cliente_id= ficha.id
          v.marca_id =  m.id
          v.piezas_12m = fila[10]
          v.piezas_fact_last_mes = fila[8]
          v.piezas_last_pedido = fila[16]
          v.piezas_pendientes = fila[7]
        end
        vdata.save!
      end
    end
  end
end
