class UsersController < ApplicationController
before_action :authenticate_user! , only: [:show, :new, :index, :edit]

    def index
      @users = User.all
      @user = current_user
      @book = Book.new
    end

    def show
      @user = User.find(params[:id])
      @book = Book.new
      @books = Book.all
    end

    def edit
      @user = User.find(params[:id])
      redirect_to user_path(current_user) unless @user.id == current_user.id
    end

    def update
      @user = User.find(params[:id])
      if @user.update(user_params)
        flash[:notice] = "User edit successfully!"
        redirect_to user_path(@user.id)
      else
        flash[:alert] = "User edit error"
        render :edit
      end
    end

    private

    def user_params
        params.require(:user).permit(:name, :introduction, :profile_image)
    end

end
