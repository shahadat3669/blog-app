class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  after_create :increment_post_likes_counter

  private

  def increment_post_likes_counter
    post.update(likes_counter: post.likes.count)
  end
end
