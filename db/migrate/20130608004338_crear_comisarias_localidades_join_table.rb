class CrearComisariasLocalidadesJoinTable < ActiveRecord::Migration
  create_table :comisarias_localidades, :id => false, :force => true do |t|
    t.integer :comisaria_id
    t.integer :localidad_id
  end

  add_index :comisarias_localidades, [:comisaria_id, :localidad_id], :unique => true
end
