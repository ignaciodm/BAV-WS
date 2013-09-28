class AddUsuarioIdToDireccion < ActiveRecord::Migration
  def change
    add_column :direcciones, :usuario_id, :integer, :null => false

    add_index :direcciones, [:id, :usuario_id], :unique => true
    add_index :direcciones, [:id, :localidad_id], :unique => true
  end
end
