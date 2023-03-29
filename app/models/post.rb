class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  after_create :increment_user_posts_counter
  
  private

  def increment_user_posts_counter
    author.update(posts_counter: author.posts.count)
  end
end
