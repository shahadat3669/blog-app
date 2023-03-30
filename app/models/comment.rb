class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  after_create :increment_post_comments_counter

  private

  def increment_post_comments_counter
    post.update(comments_counter: post.comments.count)
  end
end
