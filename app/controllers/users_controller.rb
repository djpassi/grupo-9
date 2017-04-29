class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def index
    @users = User.all
  end

  def create
    @user = User.new(user_params)
    @user.role = "User"

    respond_to do |format|
     if @user.save
       format.html do
         redirect_to '/users/new', notice: 'User was successfully created.'
       end
       #format.json { render :show, status: :created, location: @user }
     else
       format.html { render :new, status: 422 }
       format.json { render json: @user.errors, status: :unprocessable_entity }
     end
   end

 end




  #   if @user.save
  #       redirect_to '/users/new', notice: "User created"
  #   else
  #       redirect_to '/users/new', notice: "User could not be created"
  #   end
  # end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email,
     :password, :birth_date, :password_confirmation)
  end


end
