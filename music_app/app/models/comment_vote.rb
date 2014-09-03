class Comment_vote < ActiveRecord::Base
validates_uniqueness_of :comment_id, scope: :user_id
validates_inclusion_of :value, in: [1, -1]
validate :ensure_not_author

def ensure_not_author
  errors.add :user_id, "is the author of the comment" if track.comment.user_id == user_id
end
end