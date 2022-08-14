class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  def self.update_comments_counter(post)
    Post.find(post.id).increment!(:comments_counter)
  end
end
