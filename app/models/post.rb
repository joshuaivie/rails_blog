class Post < ApplicationRecord
  has_many :comments
  has_many :likes
  belongs_to :author, class_name: 'User'

  def self.update_post_counter(user)
    User.find(user.id).increment!(:posts_counter)
  end

  def self.most_recent_comments(post)
    Comment.where(post_id: post.id).limit(5).order(updated_at: :asc)
  end
end
