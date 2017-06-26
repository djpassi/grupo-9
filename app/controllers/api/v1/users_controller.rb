module Api::V1
  class UsersController < ApiController

    before_action :authenticate
    before_action :set_user, only: [:show]




    def show; end


    private

    def set_user
     @user = User.find(params[:id])
    end




  end
end
