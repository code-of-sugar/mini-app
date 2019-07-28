class UsersController < ApplicationController
  def index
    @posts = Post.where(user_id: current_user.id).page(params[:page]).per(20)
  end

  def edit
  end

  def update
    current_user.update(user_params)
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
