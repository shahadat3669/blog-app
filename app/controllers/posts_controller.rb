class PostsController < ApplicationController
  def index
    @user = User.find(request.params['user_id'])
  end

  def show
    @post = Post.find(request.params['id'])
  end

  def new
    @id = current_user.id
    @post = Post.new
  end
end
