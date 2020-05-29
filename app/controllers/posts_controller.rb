class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :show]
  before_action :set_post, only: [:show]

  def index
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params.require(:post).permit(:date, :reason))
    @post.user_id = current_user.id
    @post.save

    redirect_to @post
  end

  def show
    @post = Post.find(params[:id])
    # logger.log(@post.inspect)
  end

  private
  def post_params
    params.require(:post).permit(:date, :reason, :user_id)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
