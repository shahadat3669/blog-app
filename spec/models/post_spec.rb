require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:author) { User.create(name: 'Shahadat Hossain', photo: 'https://images.unsplash.com/photo-1651684215020-f7a5b6610f23?&fit=crop&w=640', bio: 'A skilled carpenter with over 15 years of experience, specializing in custom furniture design and installation.') }
  let(:user) { User.create(name: 'Rakibul Islam', photo: 'https://images.unsplash.com/photo-1530268729831-4b0b9e170218?&fit=crop&w=640', bio: 'A licensed therapist with expertise in cognitive-behavioral therapy and trauma-informed care.') }

  let(:post) { Post.create(title: 'First Post', text: 'First Content', author:) }

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

  # association tests
  describe 'association:' do
    it 'belongs to an author' do
      expect(post.author).to eql(author)
    end

    it 'has many comments' do
      expect(post.comments).to be_empty
      comment = Comment.create(text: 'Test Comment', post:, user:)

      expect(post.comments).to include(comment)
    end

    it 'has many likes' do
      expect(post.likes).to be_empty
      like = Like.create(post:, user:)

      expect(post.likes).to include(like)
    end
  end
end
