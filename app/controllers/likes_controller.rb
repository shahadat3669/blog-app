class LikesController < ApplicationController
  def create
    @like = Like.new(like_params)
    respond_to do |format|
      format.html { redirect_to request.referer } if @like.save
    end
  end

  def like_params
    params.permit(:user_id, :post_id)
  end
end
