class CreateComments < ActiveRecord::Migration[6.0]
  def self.up
    create_table :comments do |t|
      t.string :title, :limit => 50, :default => "" 
      t.text :comment
      t.references :commentable, :polymorphic => true
      t.references :user
      t.string :role, :default => "comments"
      t.timestamps
    end

    add_index :comments, :commentable_type
    add_index :comments, :commentable_id
    # add_index :comments, :user_id #commented out b/c error says it alrady exists - Graeme
  end

  def self.down
    drop_table :comments
  end
end