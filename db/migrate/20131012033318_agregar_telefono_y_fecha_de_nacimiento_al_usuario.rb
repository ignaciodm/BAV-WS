class AgregarTelefonoYFechaDeNacimientoAlUsuario < ActiveRecord::Migration
  def up
    add_column :usuarios, :telefono, :string, limit: 50, null: false
    add_column :usuarios, :fecha_de_nacimiento, :date, null: false
  end

  def down
    remove_column :usuarios, :telefono
    remove_column :usuarios, :fecha_de_nacimiento
  end
end
