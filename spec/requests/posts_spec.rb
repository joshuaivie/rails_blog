require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /users/1/posts' do
    before(:example) do
      get '/users/1/posts'
    end

    it 'has a successfull response status.' do
      expect(response).to have_http_status(:success)
    end

    it 'renders the correct template.' do
      expect(response).to render_template('index')
    end

    it 'includes the correct placeholder text.' do
      expect(response.body).to include('This is a list of posts')
    end
  end

  describe 'GET /users/1/posts/1' do
    before(:example) do
      get '/users/1/posts/1'
    end

    it 'has a successfull response status.' do
      expect(response).to have_http_status(:success)
    end

    it 'renders the correct template.' do
      expect(response).to render_template('show')
    end

    it 'includes the correct placeholder text.' do
      expect(response.body).to include('This is a single post')
    end
  end
end
