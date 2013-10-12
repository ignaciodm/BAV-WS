class AddEntreCalle1yEntreCalle2ALaDireccion < ActiveRecord::Migration
  def up
    add_column :direcciones, :entre_calle_1, :string
    add_column :direcciones, :entre_calle_2, :string
  end

  def down
    remove_column :direcciones, :entre_calle_1, :string
    remove_column :direcciones, :entre_calle_2, :string
  end
end
