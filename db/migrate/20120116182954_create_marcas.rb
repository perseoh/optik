class CreateMarcas < ActiveRecord::Migration
  def change
    create_table :marcas do |t|
      t.integer :user_id
      t.string :codigo

      t.timestamps
    end
  end
end
