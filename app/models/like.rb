class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  def self.update_likes_counter(post)
    Post.find(post.id).increment!(:likes_counter)
  end
end
