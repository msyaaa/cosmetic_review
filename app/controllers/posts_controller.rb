class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :index_post, only: [:top, :index, :show]
  before_action :set_parents
  def top
    # @categories = Category.all
    # @children = Category.find(params[:parent_id]).children
    respond_to do |format|
      format.html
      format.json do
        if params[:parent_id]
          @childrens = Category.find(params[:parent_id]).children
        elsif params[:children_id]
          @grandChilds = Category.find(params[:children_id]).children
        elsif params[:gcchildren_id]
          @parents = Category.where(id: params[:gcchildren_id])
        end
      end
    end
  end
  def index
  end
  def new
    @post = Post.new
    # @children = Category.find(params[:parent_id]).children
    # respond_to do |format|
    #   format.html
    #   format.json
    # end
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
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to post_path
    else
      render :edit
    end
  end

  def destroy 
    if @post.destroy
      redirect_to posts_path
    else
      render :show
    end
  end

  private

  def post_params
    params.require(:post).permit(:name, :image, :price, :evaluation, :description, :category_id, :shop_name).merge(user_id: current_user.id)
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def index_post
    @posts = Post.order(created_at: :desc)
  end

  def set_parents
    @parents = Category.where(ancestry: nil)
  end
end
