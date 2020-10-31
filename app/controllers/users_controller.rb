class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    birthday = @user.birthday
    date_format = "%Y%m%d"
    @age = (Date.today.strftime(date_format).to_i - birthday.strftime(date_format).to_i) / 10000
    @posts = @user.posts.order(created_at: :desc)

    likes = Like.where(user_id: current_user.id).order(created_at: :desc).pluck(:post_id)
    @likes = Post.find(likes)
  end
end
