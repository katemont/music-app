class Track < ActiveRecord::Base
  attr_accessible :artwork_file, :description, :music_file, :name, :user_id

  mount_uploader :music_file, MusicFileUploader
  belongs_to :user
  acts_as_commentable
  acts_as_votable
end
