require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:user) { User.create(name: 'Shahadat Hossain', photo: 'https://images.unsplash.com/photo-1651684215020-f7a5b6610f23?&fit=crop&w=640', bio: 'A skilled carpenter with over 15 years of experience, specializing in custom furniture design and installation.') }
  let(:post) { Post.create(title: 'First Post', text: 'First Content', author: user) }
  let(:post2) { Post.create(title: 'Second Post', text: 'Second Content', author: user) }
  let!(:like) { Like.create(user:, post:) }

  # validation tests
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

  # method tests
  describe 'callbacks:' do
    it 'returns empty if the post has no likes' do
      expect(post2.likes_counter).to eq(0)
    end

    it 'increments the post likes counter after creating a new like' do
      Like.create(user:, post: post2)

      expect(post2.reload.likes_counter).to eq(1)
    end

    it 'Not increment the post likes counter for creating two like with same user and post' do
      Like.create(user:, post: post2)
      Like.create(user:, post: post2)

      expect(post2.reload.likes_counter).to eq(1)
    end

    it 'increment the post likes counter for creating like with different users and same post' do
      user2 = User.create(name: 'Rakibul Islam', photo: 'https://images.unsplash.com/photo-1530268729831-4b0b9e170218',
                          bio: 'bio')
      Like.create(user:, post: post2)
      Like.create(user: user2, post: post2)

      expect(post2.reload.likes_counter).to eq(2)
    end
  end
end
