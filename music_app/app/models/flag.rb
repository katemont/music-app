class Flag < ActiveRecord::Base

  attr_accessible :value, :comment_id, :user_id
  belongs_to :user
  belongs_to :comment

  validates :user_id, uniqueness: {scope: :comment_id}

end

