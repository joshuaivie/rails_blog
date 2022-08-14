class Post < ApplicationRecord
  has_many :comments
  has_many :likes
  belongs_to :author, class_name: 'User'

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { greater_than_or_equal_to: 0 }

  def self.update_post_counter(user)
    User.find(user.id).increment!(:posts_counter)
  end

  def most_recent_comments
    Comment.where(post_id: id).limit(5).order(updated_at: :asc)
  end
end
