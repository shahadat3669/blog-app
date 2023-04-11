require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Shahadat Hossain', photo: 'https://images.unsplash.com/photo-1651684215020-f7a5b6610f23?&fit=crop&w=640', bio: 'A skilled carpenter with over 15 years of experience, specializing in custom furniture design and installation.') }

  before { subject.save }

  # validation tests
  describe 'validations' do
    it 'validates the presence of name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'validates that posts_counter was set' do
      expect(subject).to be_valid
      expect(subject.posts_counter).to eql(0)
    end

    it 'validates the presence of posts_counter' do
      subject.posts_counter = nil
      expect(subject).to_not be_valid
    end

    it 'validates that posts counter is a positive integer' do
      subject.posts_counter = -1
      expect(subject).to_not be_valid
    end
  end

  # method tests
  describe '#recent_posts' do
    it 'returns empty if the user has no posts' do
      expect(subject.recent_posts.to_a).to eql([])
    end

    it 'returns the 3 most recent posts for the user if user has more than 3 post' do
      old_post = subject.posts.create(title: 'Older Post', text: 'Content', created_at: 1.day.ago)
      new_post = subject.posts.create(title: 'Newer Post', text: 'Content')
      new_post2 = subject.posts.create(title: 'Newest Post', text: 'Content', created_at: 1.hour.ago)
      new_post3 = subject.posts.create(title: 'Newest Post', text: 'Content', created_at: 2.hour.ago)

      recent_posts = subject.recent_posts

      expect(recent_posts).to eq([new_post, new_post2, new_post3])
      expect(recent_posts.size).to eq(3)
      expect(recent_posts).to_not include(old_post)
    end

    it 'returns the 3 most recent posts for the user if user has 3 post only' do
      new_post = subject.posts.create(title: 'Newer Post', text: 'Content')
      new_post2 = subject.posts.create(title: 'Newest Post', text: 'Content', created_at: 1.hour.ago)
      new_post3 = subject.posts.create(title: 'Newest Post', text: 'Content', created_at: 2.hour.ago)

      recent_posts = subject.recent_posts

      expect(recent_posts).to eq([new_post, new_post2, new_post3])
      expect(recent_posts.size).to eq(3)
    end

    it 'returns less than 3 posts if the user has less than 3 posts' do
      new_post = subject.posts.create(title: 'Post', text: 'Content')

      recent_posts = subject.recent_posts

      expect(recent_posts).to eq([new_post])
      expect(recent_posts.size).to eq(1)
    end
  end
end
