class CreatePartidos < ActiveRecord::Migration
  def change
    create_table :partidos do |t|
      t.string :nombre, null: false
      t.integer :provincia_id, null: false

      t.timestamps
    end
  end
end
