require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'Fetch list of users' do
    before(:example) do
      get '/users'
    end

    it 'has a successfull response status.' do
      expect(response).to have_http_status(:success)
    end

    it 'renders the correct template.' do
      expect(response).to render_template('index')
    end
  end

  describe 'Fetch user with id 1' do
    before(:example) do
      get '/users/1'
    end

    it 'has a successfull response status.' do
      expect(response).to have_http_status(:success)
    end

    it 'renders the correct template.' do
      expect(response).to render_template('show')
    end
  end

  describe 'User index page' do
    before(:example) { visit users_path }
    before(:all) { @users = User.all }
    it 'I can see the username of all other users' do
      @users.each do |user|
        expect(page).to have_content(user.name)
      end
    end
    it 'I can see the profile picture for each user.' do
      @users.each do |user|
        expect(page).to have_xpath("//img[@src='#{user.photo}']")
      end
    end

    it 'I can see the number of posts each user has written.' do
      @users.each do |user|
        expect(page).to have_content(user.posts_counter)
      end
    end

    it "When I click on a user, I am redirected to that user's show page." do
      @users.each do |user|
        find(:xpath, "//a[@href='/users/#{user.id}']").click
        expect(page).to have_current_path("/users/#{user.id}")
        visit users_path
      end
    end
  end

  describe 'User show page' do
    before(:example) { visit user_path(1) }
    before(:all) { @user = User.find 1 }
    it "I can see the user's profile picture." do
      expect(page).to have_xpath("//img[@src='#{@user.photo}']")
    end
    it "I can see the user's username." do
      expect(page).to have_content(@user.name)
    end
    it 'I can see the number of posts the user has written.' do
      expect(page).to have_content("Number of posts: #{@user.posts_counter}")
    end
    it "I can see the user's bio." do
      expect(page).to have_content(@user.bio)
    end
    it "I can see the user's first 3 posts." do
      @user.posts.order(created_at: :asc).limit(3).each do |post|
        expect(page).to have_content(post.title)
      end
    end
    it "I can see a button that lets me view all of a user's posts." do
      expect(page).to have_content('All Posts')
    end
    it "When I click a user's post, it redirects me to that post's show page." do
      @user.posts.order(created_at: :asc).limit(3).each do |post|
        find(:xpath, "//a[@href='/users/#{@user.id}/posts/#{post.id}']").click
        expect(page).to have_current_path("/users/#{@user.id}/posts/#{post.id}")
        visit user_path(@user)
      end
    end
    it "When I click on all posts, it redirects me to the user's post's index page." do
      click_link('All Posts')
      expect(page).to have_current_path("/users/#{@user.id}/posts")
    end
  end
end
