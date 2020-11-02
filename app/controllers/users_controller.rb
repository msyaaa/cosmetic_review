class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit]
  def show
    birthday = @user.birthday
    date_format = "%Y%m%d"
    @age = (Date.today.strftime(date_format).to_i - birthday.strftime(date_format).to_i) / 10000
    @posts = @user.posts.order(created_at: :desc)

    likes = Like.where(user_id: current_user.id).order(created_at: :desc).pluck(:post_id)
    @likes = Post.find(likes)
  end

  def edit
  end
  def update
    if current_user.update(user_params)
      redirect_to action: :show
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:nickname, :birthday, :introduce, :gender, :image, :email)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
