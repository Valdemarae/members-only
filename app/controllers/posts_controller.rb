class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build

    if @post.save
      redirect_to root_path
    else
      render new_post_path
    end
  end
end
