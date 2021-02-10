class BooksController < ApplicationController
before_action :authenticate_user! , only: [:show, :new, :edit, :index, :new]

  def new
    @book = Book.new
    @books = Book.all
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "Book create successfully!"
      redirect_to book_path(@book.id)
    else
      flash[:alert] = "Book create error"
      @books = Book.all
      @user = User.find(current_user.id)
      render :index
    end
  end

  def index
    @book = Book.new
    @books = Book.all
    @users = User.all
    @user = current_user
  end

  def show
    @book = Book.find(params[:id])
    @user = User.find_by(id: @book.user)
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "Book edit successfully!"
      redirect_to book_path(@book.id)
    else
      flash[:alert] = "Book edit error"
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :body, :user_id)
  end

end
