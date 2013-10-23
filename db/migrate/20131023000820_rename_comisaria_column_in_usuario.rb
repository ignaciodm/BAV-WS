class RenameComisariaColumnInUsuario < ActiveRecord::Migration
  def change
    rename_column :usuarios, :comisaria, :is_comisaria
  end
end
