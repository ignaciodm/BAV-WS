class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :name
      t.string :street
      t.integer :number
      t.string :details

      t.timestamps
    end
  end
end
