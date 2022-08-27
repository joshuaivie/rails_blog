require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'Fetch all user one posts' do
    before(:example) do
      get '/users/1/posts'
    end

    it 'has a successfull response status.' do
      expect(response).to have_http_status(:success)
    end

    it 'renders the correct template.' do
      expect(response).to render_template('index')
    end
  end

  describe 'Fetch user ones post with id 1' do
    before(:example) do
      get '/users/1/posts/1'
    end

    it 'has a successfull response status.' do
      expect(response).to have_http_status(:success)
    end

    it 'renders the correct template.' do
      expect(response).to render_template('show')
    end
  end

  describe 'User post index page' do
    before(:example) { visit user_posts_path(1) }
    before(:all) do
      @user = User.find(1)
    end
    it "I can see the user's profile picture." do
      expect(page).to have_xpath("//img[@src='#{@user.photo}']")
    end
    it "I can see the user's username." do
      expect(page).to have_content(@user.name)
    end
    it 'I can see the number of posts the user has written.' do
      expect(page).to have_content("Number of posts: #{@user.posts_counter}")
    end
    it "I can see a post's title." do
      @user.posts.order(id: :asc).limit(3).each_with_index do |post, _index|
        expect(page).to have_content(post.title)
      end
    end
    it "I can see some of the post's body." do
      @user.posts.order(id: :asc).limit(3).each_with_index do |post, _index|
        expect(page).to have_content(post.text[0..100])
      end
    end
    it 'I can see the first comments on a post.' do
      @user.posts.order(id: :asc).each_with_index do |post, index|
        first_comment = post.comments.order(created_at: :asc).first
        expect(page).to have_content(first_comment.text) unless first_comment.nil?
        visit user_posts_path(1, page: (index / 2) + 2) if index.odd?
      end
    end
    it 'I can see how many comments a post has.' do
      @user.posts.order(id: :asc).limit(3).each_with_index do |post, _index|
        expect(page).to have_content("Comments: #{post.comments_counter}")
      end
    end
    it 'I can see how many likes a post has.' do
      @user.posts.order(id: :asc).limit(3).each_with_index do |post, _index|
        expect(page).to have_content("Likes: #{post.likes_counter}")
      end
    end
    it 'I can see a section for pagination if there are more posts than fit on the view.' do
      expect(page).to have_xpath("//div[@id='pagination']")
    end
    it "When I click on a post, it redirects me to that post's show page." do
      @user.posts.order(id: :asc).limit(3).each do |post|
        visit user_posts_path(1)
        find(:xpath, "//a[@href='/users/#{@user.id}/posts/#{post.id}']").click
        expect(page).to have_current_path("/users/#{@user.id}/posts/#{post.id}")
      end
    end
  end
end
