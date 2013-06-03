class CreateDirecciones < ActiveRecord::Migration
  def change
    create_table :direcciones do |t|
      t.string :descripcion, null: false
      t.string :calle, null: false
      t.integer :numero, null: false
      t.integer :piso, null: true
      t.string :departamento, null: true
      t.string :comentarios

      t.timestamps
    end
  end
end
