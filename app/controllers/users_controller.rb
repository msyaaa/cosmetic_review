class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    birthday = @user.birthday
    date_format = "%Y%m%d"
    @age = (Date.today.strftime(date_format).to_i - birthday.strftime(date_format).to_i) / 10000
  end
end
