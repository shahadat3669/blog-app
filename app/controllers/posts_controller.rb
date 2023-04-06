class PostsController < ApplicationController
  def index
    @user = User.find(request.params['user_id'])
  end

  def show; end
end
