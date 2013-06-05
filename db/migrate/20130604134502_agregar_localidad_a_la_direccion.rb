class AgregarLocalidadALaDireccion < ActiveRecord::Migration
  def change
    add_column :direcciones, :localidad_id, :integer, null: false
  end
end
