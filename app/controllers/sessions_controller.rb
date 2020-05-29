class SessionsController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.find_by_name(user_params[:name])
        return head(:forbidden) unless @user.authenticate(user_params[:password])
        # Login User
        session[:user_id] = @user.id
        redirect_to(user_path(@user))
    end

    private
    def user_params
        params.require(:user).permit(:name, :password)
    end
end