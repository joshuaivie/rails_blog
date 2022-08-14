class User < ApplicationRecord
  validates :name, presence: { allow_blank: false, message: 'Please supply a user name' }
  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  has_many :posts
  has_many :comments
  has_many :likes

  def most_recent_posts
    Post.where(author_id: id).limit(3).order(updated_at: :asc)
  end
end
