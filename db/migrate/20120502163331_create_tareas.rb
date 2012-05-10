class CreateTareas < ActiveRecord::Migration
  def change
    create_table :tareas do |t|
      t.integer :cliente_id
      t.string :texto
      t.integer :user_id
      t.datetime :fecha
      t.string :estado

      t.timestamps
    end
  end
end
