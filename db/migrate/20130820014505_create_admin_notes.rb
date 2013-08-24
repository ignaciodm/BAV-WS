class CreateAdminNotes < ActiveRecord::Migration
  def self.up
    create_table :admin_notes do |t|
      t.string :resource_id, :null => false
      t.string :resource_type, :null => false
      t.references :usuario, :polymorphic => true
      t.text :body
      t.timestamps
    end
    add_index :admin_notes, [:resource_type, :resource_id]
    add_index :admin_notes, [:usuario_type, :usuario_id]
  end

  def self.down
    drop_table :admin_notes
  end
end
