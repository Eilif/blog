class PostsController < ApplicationController

  def index
    @posts = Post.all :limit => 5, :order => 'id DESC'
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params[:post])
    if @post.save
      redirect_to posts_path
    else
      render :action => :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.attributes = params[:post]
    if @post.save
      redirect_to post_path(@post)
    else
      render :action => :edit
    end
  end

end
