class UsersController < ApplicationController

before_action :authenticate_user!, except: [:top, :about]

  def index
    @book = Book.new
    @user = current_user
    @users = User.all
  end

  def show
    @sbook = Book.new
    @user = User.find(params[:id])
    @books = @user.books.reverse_order
  end

  def edit
    @user = User.find(params[:id])
    if @user.name != current_user.name
          redirect_to user_path(current_user.id)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] ="You have updated user successfully."
      redirect_to user_path(@user.id)
    else
      render 'users/edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
