class CreateLocalidades < ActiveRecord::Migration
  def change
    create_table :localidades do |t|
      t.string :nombre, null: false
      t.integer :partido_id, null: false

      t.timestamps
    end
  end
end
