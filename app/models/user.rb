class User < ApplicationRecord
  has_many :posts
  has_many :comments
  has_many :likes

  def most_recent_posts
    Post.where(author_id: id).limit(3).order(updated_at: :asc)
  end
end
