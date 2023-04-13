class PostsController < ApplicationController
  def index
    @user = User.find(request.params['user_id'])
  end

  def show
    @post = Post.find(request.params['id'])
  end

  def new
    @user = current_user
    @post = @user.posts.new
  end

  def create
    @user = current_user
    @post = @user.posts.build(post_params)

    if @post.save
      redirect_to user_posts_path(@user), flash: { notice: 'Post was successfully created.' }
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
