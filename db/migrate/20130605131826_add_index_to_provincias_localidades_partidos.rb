class AddIndexToProvinciasLocalidadesPartidos < ActiveRecord::Migration
  def change
    add_index :provincias, :nombre, :unique => true

    add_index :partidos, [:nombre, :provincia_id], :unique => true
    add_index :partidos, :nombre

    add_index :localidades, [:nombre, :partido_id], :unique => true
    add_index :localidades, :nombre
  end
end
