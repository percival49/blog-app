class BlogsController < ApplicationController
  include ApplicationHelper

  before_action :require_login

  def index
    @blogs = Blog.paginate(page: params[:page], per_page: 5)
  end

  def new
    @blog = Blog.new
  end

  def show
    @comment = Comment.new
    @comments = Comment.where(blog_id: params[:id])
    @blog = Blog.find(params[:id])
  end

  def create
    @user = User.find(current_user.id)
    @blog = @user.blogs.build blog_params
    if @blog.save
      redirect_to blogs_path
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def edit
    @user = User.find(current_user.id)
    @blog = @user.blogs.where(id: params[:id])[0]
  end

  def update
    @user = User.find(current_user.id)
    @blog = @user.blogs.where(id: params[:id])[0]

    if @blog.update blog_params
      redirect_to blogs_path
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  private

  def blog_params
    params.require(:blog).permit(:title, :description, :user_id)
  end
end
