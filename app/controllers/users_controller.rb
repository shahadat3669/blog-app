class UsersController < ApplicationController
  layout 'application'
  def index
    @users = User.all
  end

  def show
    @user = User.find(request.params['id'])
  end
end
