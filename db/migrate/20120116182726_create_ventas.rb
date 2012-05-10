class CreateVentas < ActiveRecord::Migration
  def change
    create_table :ventas do |t|
      t.integer :user_id
      t.integer :cliente_id
      t.integer :marca_id
      t.integer :piezas_12m
      t.integer :piezas_last_pedido
      t.integer :piezas_pendientes
      t.integer :piezas_fact_last_mes

      t.timestamps
    end
  end
end
