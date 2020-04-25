class PostsController < ApplicationController
  def index
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params.require(:post).permit(:date, :reason))

    @post.save

    redirect_to @post
  end

  def show
    @post = Post.find(params[:id])
    # logger.log(@post.inspect)
  end
end
