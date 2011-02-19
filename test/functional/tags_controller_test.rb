require 'test_helper'

class TagsControllerTest < ActionController::TestCase

  test "should get new tag when logged in" do
    log_in
    @post = valid_post
    get :new, :post_id => @post.to_param
    assert_response :success
  end

  test "should create tag on correct post when logged in, redirect to post" do
    log_in
    @post = valid_post
    post :create, :post_id => @post.to_param, :tag => {:text => "weaving"}
    assert_equal "weaving", Tag.last.text
    assert_redirected_to post_path(@post)
  end

  test "should not create textless tag, render new tag form" do
    log_in
    @post = valid_post
    post :create, :post_id => @post.to_param, :tag => {:text => ""}
    assert_nil Tag.last
    assert_template :new
  end

  test "when not logged in should not create tag, redirect to root path" do
    @post = valid_post
    post :create, :post_id => @post.to_param, :tag => {:text => "weaving"}
    assert_nil Tag.last
    assert_redirected_to root_path
  end

  test "when logged in should get tag index" do
    log_in
    @post = valid_post
    get :index, :post_id => @post.to_param
    assert_response :success
  end

  test "when logged in show should get tags appropriate to related post" do
    log_in
    @post = valid_post
    @post.Tag.text = "unicorn"
    get :show, :post_id => @post.to_param
    assert_response :success
  end

end
