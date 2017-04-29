class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.role = "User"

    if @user.save
        redirect_to '/users/new', notice: "User created"
    else
        redirect_to '/users/new', notice: "User could not be created"
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email,
     :password, :birth_date)
  end


end
