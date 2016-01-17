class PostsController < ApplicationController

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:success] = "Your post has been created."
      redirect_to @post

    else
      flash[:alert] = "Your post is invalid!"
      render :new
    end
  end
  def index
    @posts = Post.all
  end
  private
  def post_params
    params.require(:post).permit(:title, :content)
  end

end
