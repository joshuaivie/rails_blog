class User < ApplicationRecord
  has_many :posts
  has_many :comments
  has_many :likes

  def self.most_recent_posts(user)
    Post.where(author_id: user.id).limit(3).order(updated_at: :asc)
  end
end
