class CommentsController < ApplicationController
  def new
    @user = current_user
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.user = current_user
    respond_to do |format|
      if @comment.save
        format.html do
          redirect_to user_post_path(@post.author, @post), notice: 'Comment was successfully created.'
        end
      else
        format.html { render :new }
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
