class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :title, presence: { allow_blank: false, message: 'Please supply a post title' },
                    length: { maximum: 250, message: 'Post title must not exceed 250 characters' }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  after_create :update_posts_counter

  def most_recent_comments
    comments.limit(5).order(updated_at: :asc)
  end

  private

  def update_posts_counter
    author.increment!(:posts_counter)
  end
end
