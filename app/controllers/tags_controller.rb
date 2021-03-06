class TagsController < ApplicationController

  def index
    @post = Post.find(params[:post_id])
    @tags = @post.tags
  end

  def new
    @post = Post.find(params[:post_id])
    @tag = @post.tags.build
  end

  def create
    @post = Post.find(params[:post_id])
    @tag = @post.tags.build(params[:tag])
    if @tag.save
      redirect_to post_path(@post)
    else
      render :action => :new
    end
  end

end
