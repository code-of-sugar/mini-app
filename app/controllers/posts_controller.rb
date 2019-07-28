class PostsController < ApplicationController
  before_action :set_post, only: [:index]

  def index
    @posts = Post.page(params[:page]).per(20)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.save
    redirect_to root_path
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def destroy
    Post.find(params[:id]).destroy
    redirect_to root_path
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id]).update(post_params)
    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:image, :title, :caption).merge(user_id: current_user.id)
  end

  def set_post
    @posts = Post.all
  end
end