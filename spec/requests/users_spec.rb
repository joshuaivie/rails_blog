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
  end
end
