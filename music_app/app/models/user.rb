class User < ActiveRecord::Base
  has_secure_password
  
  attr_accessible :email, :name, :profile, :password_confirmation, :password, :role

  validates :password, presence: true, on: :create
  validates :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }

  def role?(role_to_compare)
      self.role.to_s == role_to_compare.to_s
  end

  has_many :tracks
  has_many :comments
  
  ROLES = %w[artist listener]

  def role_symbols
     [role.to_sym]
  end

  # def total_votes
  #   CommentVote.joins(:comment).where(comments: {user_id: self.id}).sum('value')
  # end

  def can_vote_for?(comment)
    comment_votes.build(value: 1, comment: comment).valid?
  end

end