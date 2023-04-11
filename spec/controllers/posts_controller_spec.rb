require 'rails_helper'

RSpec.describe PostsController, type: :request do
  let(:user) do
    User.create(name: 'Shahadat Hossain', photo: 'https://images.unsplash.com/photo-1651684215020-f7a5b6610f23?&fit=crop&w=640',
                bio: 'A skilled carpenter with over 15 years of experience.')
  end

  let(:post) do
    user.posts.create(author: user, title: 'First seed post',
                      text: 'Lorown printer took.')
  end

  describe 'GET #index' do
    it 'returns http success' do
      get "/users/#{user.id}/posts"
      expect(response).to have_http_status(:success)
    end

    it 'renders the index template' do
      get "/users/#{user.id}/posts"
      expect(response).to render_template(:index)
    end

    it 'includes placeholder text in the response body' do
      get "/users/#{user.id}/posts"
      expect(response.body).to include('Shahadat Hossain')
    end
  end

  describe 'GET #show' do
    it 'returns http success' do
      get "/users/#{user.id}/posts/#{post.id}"
      expect(response).to have_http_status(:success)
    end

    it 'renders the show template' do
      get "/users/#{user.id}/posts/#{post.id}"
      expect(response).to render_template(:show)
    end

    it 'includes placeholder text in the response body' do
      get "/users/#{user.id}/posts/#{post.id}"
      expect(response.body).to include("#{post.title} ##{post.id} by #{user.name}")
    end
  end
end
