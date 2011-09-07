class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.references :author
      t.string :slug

      t.timestamps
    end
    add_index :posts, :author_id
    add_index :posts, :slug, :unique => true
  end
end
