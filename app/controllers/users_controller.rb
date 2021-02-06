class UsersController < ApplicationController

    def index
      @users = User.all
      @user = current_user
    end

    def show
      @user = User.find(params[:id])
    end

    def edit
      @user = User.find(params[:id])
      redirect_to user_path(current_user) unless @user.id == current_user.id
    end

    def update
      @user = User.find(params[:id])
      @user.update(user_params)
      redirect_to user_path(@user.id)
    end

    private

    def user_params
        params.require(:user).permit(:name, :introduction, :profile_image)
    end


end
