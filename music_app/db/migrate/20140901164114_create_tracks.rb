class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :name
      t.text :description
      t.string :music_file
      t.integer :user_id
      t.string :artwork_file

      t.timestamps
    end
  end
end
