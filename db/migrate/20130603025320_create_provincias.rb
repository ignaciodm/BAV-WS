class CreateProvincias < ActiveRecord::Migration
  def change
    create_table :provincias do |t|
      t.string :nombre, null: false
      t.timestamps
    end
  end
end
