class CreateNotas < ActiveRecord::Migration
  def change
    create_table :notas do |t|
      t.integer :user
      t.integer :cliente
      t.string :texto

      t.timestamps
    end
  end
end
