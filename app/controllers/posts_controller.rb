class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :index_post, only: [:top, :index, :show]
  before_action :set_parents
  # before_action :set_category
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

    #セレクトボックスの初期値設定
    @category_parent_array = ["---"]
    #データベースから、親カテゴリーのみ抽出し、配列化
    Category.where(ancestry: nil).each do |parent|
        @category_parent_array << parent.name
    end
  end

  def get_category_children
    #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
    # @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
    @category_children = Category.find("#{params[:parent_id]}").children
 end

 # 子カテゴリーが選択された後に動くアクション
 def get_category_grandchildren
#選択された子カテゴリーに紐付く孫カテゴリーの配列を取得
    # @category_grandchildren = Category.find("#{params[:child_id]}").children
    @category_grandchildren = Category.find("#{params[:child_id]}").children
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
    redirect_to root_path if current_user.id != Post.find(params[:id]).user_id
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

  def search
    # @posts = @category.set_items
    # @posts = @posts.where(user_id: nil).order("created_at DESC").page(params[:page]).per(9)


    # カテゴリ名を取得するために@categoryにレコードをとってくる
    @category = Category.find_by(id: params[:id])

    # 親カテゴリーを選択していた場合の処理
    if @category.ancestry == nil
      # Categoryモデル内の親カテゴリーに紐づく孫カテゴリーのidを取得
      category = Category.find_by(id: params[:id]).indirect_ids
      if category.empty?
        @posts = Post.where(category_id: @category.id).order(created_at: :desc)
        # parent_category = Category.find(@category.id)
        # @posts = parent_category.posts.order(created_at: :desc)
      else
        # 孫カテゴリーに該当するitemsテーブルのレコードを入れるようの配列を用意
        @posts = []
        # find_itemメソッドで処理
        find_item(category)
      end

    # 孫カテゴリーを選択していた場合の処理
    elsif @category.ancestry.include?("/")
      # Categoryモデル内の親カテゴリーに紐づく孫カテゴリーのidを取得
      @posts = Post.where(category_id: params[:id]).order(created_at: :desc)

    # 子カテゴリーを選択していた場合の処理
    else
      category = Category.find_by(id: params[:id]).child_ids
      # 孫カテゴリーに該当するitemsテーブルのレコードを入れるようの配列を用意
      @posts = []
      # find_itemメソッドで処理
      find_item(category)
    end
  end

  def name_search
    @posts = Post.search(params[:keyword]).order(created_at: :desc).page(params[:page]).per(10)
    @keyword = params[:keyword]
  end

  private

  def post_params
    params.require(:post).permit(:name, :image, :price, :evaluation, :description, :category_id, :shop_name).merge(user_id: current_user.id)
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def index_post
    @posts = Post.order(created_at: :desc).page(params[:page]).per(10)
  end

  def set_parents
    @parents = Category.where(ancestry: nil)
  end

  # def set_category
  #   @category = Category.find(params[:id])
  # end

  def find_item(category)
    category.each do |id|
      post_array = Post.where(category_id: id).order(created_at: :desc)
      # find_by()メソッドで該当のレコードがなかった場合、itemオブジェクトに空の配列を入れないようにするための処理
      if post_array.present?
        post_array.each do |post|
          if post.present?
          # else
            # find_by()メソッドで該当のレコードが見つかった場合、@item配列オブジェクトにそのレコードを追加する
            @posts.push(post)
          end
        end
      end
    end
  end
end
