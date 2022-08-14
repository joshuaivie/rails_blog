class Post < ApplicationRecord
  has_many :comments
  has_many :likes
  belongs_to :author, class_name: 'User'

  def self.update_post_counter(user)
    User.find(user.id).increment!(:posts_counter)
  end
end
