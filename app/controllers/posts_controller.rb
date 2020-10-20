class PostsController < ApplicationController
  def top
    @posts = Post.order(created_at: :desc)
  end
  def index
    @posts = Post.order(created_at: :desc)
  end
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.valid?
      @post.save
      # redirect_to posts_path
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
    @posts = Post.order(created_at: :desc)
  end

  private

  def post_params
    params.require(:post).permit(:name, :image, :price, :evaluation, :description, :category_id, :shop_name).merge(user_id: current_user.id)
  end
end
