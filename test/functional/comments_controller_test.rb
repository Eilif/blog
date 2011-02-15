require 'test_helper'

class CommentsControllerTest < ActionController::TestCase

  test "should get new comment" do
    @post = valid_post
    get :new, :post_id => @post.to_param
    assert_response :success
  end

  test "create should save comment to assoc post and redirect to assoc post" do
    @post = valid_post
    post :create, :post_id => @post.to_param, :comment => {:comment_text => "I wish I could get out too.", :creator_alias => "Verthandi", :creator_email => "v@ygg.net"}
    assert_not_nil Comment.last
    assert_equal @post, Comment.last.post
    assert_equal "I wish I could get out too.", Comment.last.comment_text
    assert_equal "Verthandi", Comment.last.creator_alias
    assert_equal "v@ygg.net", Comment.last.creator_email
    assert_redirected_to post_path(@post)
  end

  test "comments without valid input should not save, render new comment form" do
    @post = valid_post
    post :create, :post_id => @post.to_param, :comment => {:comment_text => "I only take.", :creator_alias => "thatgoat", :creator_email => ""}
    assert_nil Comment.last
    assert_template :new
  end

end
