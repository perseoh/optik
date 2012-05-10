class CreateCitas < ActiveRecord::Migration
  def change
    create_table :citas do |t|
      t.integer :user_id
      t.integer :cliente_id
      t.string :texto
      t.datetime :fecha

      t.timestamps
    end
  end
end
