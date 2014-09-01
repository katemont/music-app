class Track < ActiveRecord::Base
  attr_accessible :artwork_file, :description, :music_file, :name, :user_id
end
