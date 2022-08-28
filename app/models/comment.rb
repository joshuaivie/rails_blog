class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  after_create :update_comments_counter

  validates :text, presence: { allow_blank: false, message: 'Please supply a comment' },
                   length: { maximum: 500, message: 'Comment must not exceed 500 characters' }

  private

  def update_comments_counter
    post.increment!(:comments_counter)
  end
end
