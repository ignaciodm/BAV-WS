class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :name, null: false
      t.string :street, null: false
      t.integer :number, null: false
      t.integer :floor, null: true
      t.string :flat, null: true
      t.string :details

      t.timestamps
    end
  end
end
