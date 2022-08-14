require 'rails_helper'

RSpec.describe Post, type: :model do
  context 'When creating a new user:' do
    before :each do
      @user = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.',
                          posts_counter: 0)
      @post = Post.new(author: @user, title: 'Hello One', text: 'This is my first post', comments_counter: 0,
                       likes_counter: 0)
    end

    before { @post.save }

    it 'Should validate title must not be blank.' do
      @post.title = ''
      expect(@post).to_not be_valid
    end

    it 'Should validate title must not exceed 250 characters' do
      @post.title = 'a' * 251
      expect(@post).to_not be_valid
    end

    it 'Should validate comments_counter must be an integer.' do
      @post.comments_counter = 0.5
      expect(@post).to_not be_valid
    end

    it 'Should validate comments_counter must be greater than or equal to zero.' do
      @post.comments_counter = -1
      expect(@post).to_not be_valid
    end

    it 'Should validate likes_counter must be an integer.' do
      @post.likes_counter = 0.2
      expect(@post).to_not be_valid
    end
  end

  context 'most_recent_comments method for a given post:' do
    before :each do
      @user = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.',
                          posts_counter: 0)
      @post = Post.create(author: @user, title: 'Hello One', text: 'This is my first post', comments_counter: 0,
                          likes_counter: 0)

      @post.most_recent_comments
      Comment.create(post: @post, author: @user, text: 'Hi Tom!')
      Comment.create(post: @post, author: @user, text: 'Hi Sarah!')
      Comment.create(post: @post, author: @user, text: 'Hi Joshua!')
      Comment.create(post: @post, author: @user, text: 'Hi Naomi!')
      Comment.create(post: @post, author: @user, text: 'Hi Ruth!')
    end

    it 'Should return 5 most recent comments' do
      result = @post.most_recent_comments

      expect(result.length).to eq(5)
    end
  end
end
