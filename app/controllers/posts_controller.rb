class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :new]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to root_path
    else
      render new_post_path
    end
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end
