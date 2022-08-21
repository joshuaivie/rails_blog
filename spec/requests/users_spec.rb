require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /users' do
    before(:example) do
      get '/users'
    end

    it 'has a successfull response status.' do
      expect(response).to have_http_status(:success)
    end

    it 'renders the correct template.' do
      expect(response).to render_template('index')
    end

    it 'includes the correct placeholder text.' do
      expect(response.body).to include('This is a list of users')
    end
  end

  describe 'GET /users/1' do
    before(:example) do
      get '/users/1'
    end

    it 'has a successfull response status.' do
      expect(response).to have_http_status(:success)
    end

    it 'renders the correct template.' do
      expect(response).to render_template('show')
    end

    it 'includes the correct placeholder text.' do
      expect(response.body).to include('This is a single users profile')
    end
  end
end
