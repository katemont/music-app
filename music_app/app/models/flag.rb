class Flag < ActiveRecord::Base

attr_accessible :value, :comment_id, :user_id
belongs_to :user
belongs_to :comment

validates_uniqueness_of :comment_id, scope: :user_id

end