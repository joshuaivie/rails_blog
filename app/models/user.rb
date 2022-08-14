class User < ApplicationRecord
  has_many :posts
  has_many :comments
  has_many :likes

  validates :name, presence: true
  validates :posts_counter, numericality: { greater_than_or_equal_to: 0 }

  def most_recent_posts
    Post.where(author_id: id).limit(3).order(updated_at: :asc)
  end
end
