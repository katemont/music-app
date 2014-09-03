class Track < ActiveRecord::Base
  attr_accessible :artwork_file, :description, :music_file, :name, :user_id

  mount_uploader :music_file, MusicFileUploader
  mount_uploader :artwork_file, ArtworkFileUploader
  belongs_to :user
  acts_as_commentable
  
  validates :name, presence: true
  validates :music_file, presence: true
  
end
