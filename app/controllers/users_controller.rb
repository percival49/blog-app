class UsersController < ApplicationController
  include ApplicationHelper

  before_action :require_login, except: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      redirect_to blogs_path
    else
      render 'signup', status: :unprocessable_entity
    end
  end

  def show
    @user = User.find(current_user.id)
    @blogs = @user.blogs
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
