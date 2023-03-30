class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :text, presence: true

  after_create :increment_post_comments_counter

  private

  def increment_post_comments_counter
    post.update(comments_counter: post.comments.count)
  end
end
