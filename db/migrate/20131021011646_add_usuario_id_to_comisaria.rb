class AddUsuarioIdToComisaria < ActiveRecord::Migration
  def change
    add_column :comisarias, :usuario_id, :integer, :null => false
  end
end
