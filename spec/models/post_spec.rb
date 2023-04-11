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

  # methods tests
  describe 'callbacks:' do
    it 'returns empty if the author has no post' do
      expect(user.posts_counter).to eq(0)
    end

    it 'increments the post counter after creating a new post' do
      Post.create(title: 'First Post', text: 'First Content', author: user)

      expect(user.reload.posts_counter).to eq(1)
    end

    it 'increment the post counter for creating two post by same user' do
      Post.create(title: 'First Post', text: 'First Content', author: user)
      Post.create(title: 'Second Post', text: 'Second Content', author: user)

      expect(user.reload.posts_counter).to eq(2)
    end
  end

  describe '#recent_comments' do
    it 'returns empty if the post has no comments' do
      expect(post.recent_comments.to_a).to eql([])
    end

    it 'returns the 5 most recent comments for the post if post has more than 5 comments' do
      old_comment = post.comments.create(text: 'Old Comment', user:, post:, created_at: 1.day.ago)
      new_comment = post.comments.create(text: 'New Comment', user:, post:)
      new_comment2 = post.comments.create(text: 'New Comment2', user:, post:, created_at: 1.hour.ago)
      new_comment3 = post.comments.create(text: 'New Comment3', user:, post:, created_at: 2.hour.ago)
      new_comment4 = post.comments.create(text: 'New Comment4', user:, post:, created_at: 3.hour.ago)
      new_comment5 = post.comments.create(text: 'New Comment5', user:, post:, created_at: 4.hour.ago)

      recent_comments = post.recent_comments

      expect(recent_comments).to eq([new_comment, new_comment2, new_comment3, new_comment4, new_comment5])
      expect(recent_comments.size).to eq(5)
      expect(recent_comments).to_not include(old_comment)
    end

    it 'returns the 5 most recent comments for the post if post has 5 comments only' do
      new_comment = post.comments.create(text: 'New Comment', user:, post:)
      new_comment2 = post.comments.create(text: 'New Comment2', user:, post:, created_at: 1.hour.ago)
      new_comment3 = post.comments.create(text: 'New Comment3', user:, post:, created_at: 2.hour.ago)
      new_comment4 = post.comments.create(text: 'New Comment4', user:, post:, created_at: 3.hour.ago)
      new_comment5 = post.comments.create(text: 'New Comment5', user:, post:, created_at: 4.hour.ago)

      recent_comments = post.recent_comments

      expect(recent_comments).to eq([new_comment, new_comment2, new_comment3, new_comment4, new_comment5])
      expect(recent_comments.size).to eq(5)
    end

    it 'returns less than 5 recent comments if the post has less than 5 comments' do
      new_comment = post.comments.create(text: 'New Comment', user:, post:)

      recent_comments = post.recent_comments

      expect(recent_comments).to eq([new_comment])
      expect(recent_comments.size).to eq(1)
    end
  end
end
