require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) { User.create(name: 'Shahadat Hossain', photo: 'https://images.unsplash.com/photo-1651684215020-f7a5b6610f23?&fit=crop&w=640', bio: 'A skilled carpenter with over 15 years of experience, specializing in custom furniture design and installation.') }
  let(:post) { Post.create(title: 'First Post', text: 'First Content', author: user) }

  describe 'validations:' do
    it 'validates the presence of user when post exist' do
      comment = Comment.new(post:)

      expect(comment).to_not be_valid
      expect(comment.errors[:user]).to include('must exist')
    end

    it 'validates the presence of user when post and text exist' do
      comment = Comment.new(post:, text: 'Test comment')

      expect(comment).to_not be_valid
      expect(comment.errors[:user]).to include('must exist')
    end

    it 'validates the presence of post when user exist' do
      comment = Comment.new(user:)

      expect(comment).to_not be_valid
      expect(comment.errors[:post]).to include('must exist')
    end

    it 'validates the presence of post when user and text exist' do
      comment = Comment.new(user:, text: 'Test comment')

      expect(comment).to_not be_valid
      expect(comment.errors[:post]).to include('must exist')
    end

    it 'validates the presence of text when user and post exist' do
      comment = Comment.new(user:, post:)

      expect(comment).to_not be_valid
      expect(comment.errors[:text]).to include("can't be blank")
    end

    it 'validates that one user can comment when user, post and text exist' do
      comment = Comment.new(user:, post:, text: 'Test comment')

      expect(comment).to be_valid
    end

    it 'validates that one user can comment multiple times in same post when user, post and text exist' do
      comment = Comment.create(text: 'Test comment', user:, post:)
      comment2 = Comment.create(text: 'Test comment 2', user:, post:)

      expect(comment).to be_valid
      expect(comment2).to be_valid
      expect(post.comments).to include(comment, comment2)
    end
  end
end
