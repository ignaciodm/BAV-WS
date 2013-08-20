class CrearUsuarios < ActiveRecord::Migration

  def change
    create_table :usuarios do |t|
      t.string :nombre, limit: 50, null: false
      t.string :apellido, limit: 50, null: false
      t.string :dni, limit: 25, null: false
      t.boolean :bloqueado, default: false
      t.timestamps
    end

    add_column :direcciones, :usuario_id, :integer, null: false
    add_index :direcciones, [:descripcion, :usuario_id], :unique => true
  end
end
