require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Creating a new user:' do
    before :each do
      @user = User.new(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.',
                       posts_counter: 0)
    end

    before { @user.save }

    it 'Should validate that name is not be blank.' do
      @user.name = ''
      expect(@user).to_not be_valid
    end

    it 'Should validate that posts_counter is an integer.' do
      @user.posts_counter = 1.5
      expect(@user).to_not be_valid
    end

    it 'Should validate that posts_counter is greater than or equal to zero.' do
      @user.posts_counter = -2
      expect(@user).to_not be_valid
    end

    it 'Should validate that posts_counter is greater than or equal to zero.' do
      @user.posts_counter = 1
      expect(@user).to be_valid
    end
  end

  context 'most_recent_posts method for a given user:' do
    before :each do
      @user = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                          bio: 'Teacher from Poland.', posts_counter: 0)

      Post.create(author_id: @user.id, title: 'Hello One', text: 'This is my first post', comments_counter: 0,
                  likes_counter: 0)
      Post.create(author_id: @user.id, title: 'Hello Two', text: 'This is my second post', comments_counter: 0,
                  likes_counter: 0)
      Post.create(author_id: @user.id, title: 'Hello Three', text: 'This is my third post', comments_counter: 0,
                  likes_counter: 0)
    end

    it 'Should return 3 most recent posts' do
      result = @user.most_recent_posts

      expect(result.length).to eq(3)
    end
  end
end
