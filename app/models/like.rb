class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :user_id, uniqueness: { scope: :post_id, message: 'can only like a post once' }

  after_create :increment_post_likes_counter

  private

  def increment_post_likes_counter
    post.update(likes_counter: post.likes.count)
  end
end
