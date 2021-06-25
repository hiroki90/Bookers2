class HomesController < ApplicationController
  # before_action :authenticate_user!, except: :top
  # before_action :correct_user,   only: [:edit, :update, :destroy]

  def top
  end

  def about
  end

  private

  def correct_user
    user = User.find(params[:id])
    redirect_to(user_path(current_user)) unless current_user?(user)
  end

  def current_user?(user)
    user == current_user
  end
end
