class AddGoogleIdToAuthors < ActiveRecord::Migration
  def change
    add_column :authors, :google_id, :string
    
  end
end
