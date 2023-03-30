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
end
