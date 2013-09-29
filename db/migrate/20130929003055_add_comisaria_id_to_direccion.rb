class AddComisariaIdToDireccion < ActiveRecord::Migration
  def change
    add_column :direcciones, :comisaria_id, :integer, :null => false

    add_index :direcciones, [:id, :comisaria_id], :unique => true
  end
end
