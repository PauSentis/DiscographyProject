class CreateLps < ActiveRecord::Migration[5.1]
  def change
    create_table :lps do |t|
      t.string :name
      t.text :description
      t.string :url
      t.integer :artist_id
      t.timestamps
    end
  end
end
