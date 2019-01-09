class CreateLps < ActiveRecord::Migration[5.1]
  def change
    create_table :lps do |t|
      t.string :name, default: ""
      t.text :description, default: ""
      t.string :url, default: ""
      t.integer :artist_id
      t.timestamps
    end
  end
end
