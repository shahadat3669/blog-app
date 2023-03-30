require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) { User.create(name: 'John Doe') }
  let(:post) { Post.create(title: 'First Post', text: 'First Content', author: user) }

  # validation tests
  describe 'validations:' do
    it 'is valid with valid attributes' do
      expect(post).to be_valid
    end

    it 'validates the presence of title' do
      post.title = nil

      expect(post).to_not be_valid
    end

    it 'validates that title length is less than or equal to 250 characters' do
      post.title = 'a' * 251

      expect(post).to_not be_valid
    end

    it 'validates the presence of comments_counter' do
      post.comments_counter = nil

      expect(post).to_not be_valid
    end

    it 'validates that comments_counter is a non-negative integer' do
      post.comments_counter = -1

      expect(post).to_not be_valid
    end

    it 'validates the presence of likes_counter' do
      post.likes_counter = nil

      expect(post).to_not be_valid
    end

    it 'validates that likes_counter is a non-negative integer' do
      post.likes_counter = -1

      expect(post).to_not be_valid
    end
  end
end
