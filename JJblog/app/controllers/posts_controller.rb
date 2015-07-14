class PostsController < ApplicationController

  def new
    @user = User.find_by(id: params[:user_id])
    @post = Post.new
  end

  def create
    user = User.find_by(id: params[:user_id])
    post = Post.new(post_params)
    post.user = user
    post.save!
    redirect_to root_path
  end

  def index
    @posts = Post.where(user_id: current_user.id)
    @user = User.find_by(id: current_user.id)
  end

  def edit
    @user = User.find_by(id: current_user.id)
    @post = Post.find_by(id: params[:id])
    # @post.update_attributes(post_params)
    # redirect_to user_posts_path(@user)
  end

  def update
    @user = User.find_by(id: current_user.id)
    @post = Post.find_by(id: params[:id])
    @post.update_attributes(post_params)
    redirect_to user_posts_path(@user)
  end


  def destroy
    @user = User.find_by(id: current_user.id)
    post = Post.find_by(id: params[:id]).destroy
    redirect_to user_posts_path(@user)
  end

  private
  def post_params
    params.require(:post).permit(:title, :body)
  end
end
