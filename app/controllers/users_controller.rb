class UsersController < ApplicationController

  include Secured 

  before_action :set_user, only: [:show, :destroy, :edit, :update]
  before_action :logged_in?, only: [:destroy, :edit, :update]
  before_action only:[:destroy, :edit, :update] {valid_action(:id)} 

  def new
    @user = User.new
  end

  def edit; end

  def index
      if is_admin
        @users = User.all
      else
        redirect_to root_path, notice: "Action not allowed"
      end
  end

  def show; end

  def destroy
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
