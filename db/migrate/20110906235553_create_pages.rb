class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :title
      t.text :content
      t.string :slug
      t.boolean :header
      t.boolean :sidebar
      t.integer :rank

      t.timestamps
    end
    
    add_index :pages, :slug, :unique => true
  end
end
