class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    if @post.user_id != current_user.id
      @like = Like.create(user_id: current_user.id, post_id: @post.id)
    end
  end
  def destroy
    @post = Post.find(params[:post_id])
    @like = Like.find_by(user_id: current_user.id, post_id: @post.id)
    @like.destroy
  end
end
