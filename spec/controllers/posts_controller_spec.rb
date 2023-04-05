require 'rails_helper'

RSpec.describe PostsController, type: :request do
  describe 'GET #index' do
    it 'returns http success' do
      get '/users/1/posts'
      expect(response).to have_http_status(:success)
    end

    it 'renders the index template' do
      get '/users/1/posts'
      expect(response).to render_template(:index)
    end

    it 'includes placeholder text in the response body' do
      get '/users/1/posts'
      expect(response.body).to include('Posts#index')
    end
  end

  describe 'GET #show' do
    it 'returns http success' do
      get '/users/1/posts/1'
      expect(response).to have_http_status(:success)
    end

    it 'renders the show template' do
      get '/users/1/posts/1'
      expect(response).to render_template(:show)
    end

    it 'includes placeholder text in the response body' do
      get '/users/1/posts/1'
      expect(response.body).to include('Posts#show')
    end
  end
end
