class PostsController < ApplicationController
  before_action :set_post, only: [:edit,:destroy,:update,:show]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post[:back]
      render :new
    else
     if @post.save
      redirect_to posts_path, notice: "Tweeted！"
     else
      render :new
     end
    end
  end


  def show
  end

  def confirm
    @post = Post.new(post_params)
    render :new if @post.invalid?
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    if @post.update(post_params)
      redirect_to posts_path, notice: "Modified posts"
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path, notice: "Delited tweet"
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
