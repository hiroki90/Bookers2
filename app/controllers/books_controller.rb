class BooksController < ApplicationController

  before_action :authenticate_user!, except: [:top, :about]
  before_action :correct_user,   only: [:edit, :update, :destroy]


  def index
    @books = Book.all
    @book = Book.new
    @user = current_user
  end

  def show
    @book = Book.new
    @book_comment = BookComment.new
    @s_book = Book.find(params[:id])
    @user = @s_book.user
  end

  def create
    @user = current_user
    @books = Book.all
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] ="You have created book successfully."
      redirect_to book_path(@book.id)
    else
      render :index
    end
  end

  def edit
    #@user = User.find(params[:id])
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
       flash[:notice] ="You have updated book successfully."
    redirect_to book_path(@book.id)
    else
      render :edit
    end
  end

 def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
 end


 private

  def correct_user
    @book = Book.find(params[:id])
    redirect_to(books_path) unless current_user?(@book.user)
  end

  def current_user?(user)
    user == current_user
  end

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
