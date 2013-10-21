class AddComisariaToUser < ActiveRecord::Migration
  def change
    add_column :usuarios, :comisaria, :boolean, :default => false
  end
end
