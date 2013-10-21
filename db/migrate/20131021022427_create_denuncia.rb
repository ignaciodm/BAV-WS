class CreateDenuncia < ActiveRecord::Migration
  def change
    create_table :denuncia do |t|
      t.integer :comisaria_id, null:false
      t.integer :direccion_id, null:false
      t.string :estado, default: 'a'
      t.string :observacion

      t.timestamps
    end
  end
end
