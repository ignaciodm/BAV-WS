class CreateComisarias < ActiveRecord::Migration
  def change
    create_table :comisarias do |t|
      t.string :nombre, limit: 50, null: false
      t.string :calle, limit: 100, null: false
      t.integer :numero, null: false
      t.string :telefono, limit: 50,null: false

      t.timestamps
    end
  end
end
