class CreateExcels < ActiveRecord::Migration
  def change
    create_table :excels do |t|
      t.string :archivo
      t.string :estado
      t.integer :piezas_12m
      t.integer :piezas_last_pedido
      t.integer :piezas_pendientes
      t.integer :piezas_fact_last_mes
      t.integer :fecha_last_pedido
      t.integer :nombre
      t.integer :ciudad
      t.integer :direccion
      t.integer :provincia
      t.integer :codigo
      t.integer :cp
      t.integer :telefono
      t.integer :grupo

      t.timestamps
    end
  end
end
