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

end
