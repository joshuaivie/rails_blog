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
end
