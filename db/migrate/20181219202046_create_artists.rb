class CreateArtists < ActiveRecord::Migration[5.1]
  def change
    create_table :artists do |t|
      t.string :name, default: ""
      t.text :description, default: ""
      t.string :url, default: ""
      t.timestamps
    end
  end
end
