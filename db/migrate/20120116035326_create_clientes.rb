class CreateClientes < ActiveRecord::Migration
  def change
    create_table :clientes do |t|
      t.integer :user_id
      t.string :nombre
      t.string :ciudad
      t.string :direccion
      t.string :provincia
      t.string :codigo
      t.integer :cp
      t.string :telefono
      t.integer :grupo_id
      t.string :notas

      t.timestamps
    end
  end
end
