class AddBloqueadoComisariaToUser < ActiveRecord::Migration
  def change
    add_column :usuarios, :bloqueado_comisaria, :boolean, :default => false
  end
end
