class UsersController < ApplicationController

  before_action :set_user, only: [:show, :destroy, :edit, :update]

  def new
    @user = User.new
  end

  def edit; end

  def index
    @users = User.all
  end

  def show; end

  def destroy
    Project.delete(@user.projects)
    Comment.delete(@user.comments)
    @user.destroy
    flash[:success] = "User deleted"
    redirect_to users_url
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

 def update
   respond_to do |format|
      if @user.update(user_params)
        format.html do
          redirect_to @user, notice: 'User was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end

    end

 end


  private

  def set_user
   @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email,
     :password, :birth_date, :password_confirmation)
  end


end
