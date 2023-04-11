require 'rails_helper'

RSpec.describe UsersController, type: :request do
  let!(:user) do
    User.create(name: 'Shahadat Hossain', photo: 'https://images.unsplash.com/photo-1651684215020-f7a5b6610f23?&fit=crop&w=640',
                bio: 'A skilled carpenter with over 15 years of experience.')
  end

  let!(:post) do
    user.posts.create(author: user, title: 'First seed post',
                      text: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.')
  end

  describe 'GET #index' do
    it 'returns http success' do
      get '/users'
      expect(response).to have_http_status(:success)
    end

    it 'renders the index template' do
      get '/users'
      expect(response).to render_template(:index)
    end

    it 'includes the correct placeholder text in the response body' do
      get '/users'
      expect(response.body).to include(user.name.to_s)
    end
  end

  describe 'GET #show' do
    it 'returns http success' do
      get "/users/#{user.id}"
      expect(response).to have_http_status(:success)
    end

    it 'renders the show template' do
      get "/users/#{user.id}"
      expect(response).to render_template(:show)
    end

    it 'includes the correct placeholder text in the response body' do
      get "/users/#{user.id}"
      expect(response.body).to include(user.name.to_s)
    end
  end
end
