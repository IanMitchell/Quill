class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.string :file

      t.timestamps
    end
  end
end
