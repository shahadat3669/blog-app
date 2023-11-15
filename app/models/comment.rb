class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  # Validations

  validates :text, presence: true, length: { minimum: 5, maximum: 1_000 }

  after_create :increment_post_comments_counter

  private

  def increment_post_comments_counter
    post.update(comments_counter: post.comments.count)
  end
end
