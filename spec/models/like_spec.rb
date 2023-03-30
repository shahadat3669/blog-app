require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:user) { User.create(name: 'Shahadat Hossain', photo: 'https://images.unsplash.com/photo-1651684215020-f7a5b6610f23?&fit=crop&w=640', bio: 'A skilled carpenter with over 15 years of experience, specializing in custom furniture design and installation.') }
  let(:post) { Post.create(title: 'First Post', text: 'First Content', author: user) }
  let(:post2) { Post.create(title: 'Second Post', text: 'Second Content', author: user) }
  let!(:like) { Like.create(user:, post:) }

  describe 'validations:' do
    it 'validates the presence of user' do
      like2 = Like.new(post:)

      expect(like2).to_not be_valid
      expect(like2.errors[:user]).to include('must exist')
    end

    it 'validates the presence of post' do
      like2 = Like.new(user:)

      expect(like2).to_not be_valid
      expect(like2.errors[:post]).to include('must exist')
    end

    it 'validates that one user can only like one post once' do
      like2 = Like.new(user:, post:)
      like3 = Like.new(user:, post: post2)

      expect(like2).to_not be_valid
      expect(like2.errors[:user_id]).to include('can only like a post once')
      expect(like3).to be_valid
    end
  end
end
