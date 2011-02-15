require 'test_helper'

class PostsControllerTest < ActionController::TestCase

  test "should get new post when logged in" do
    log_in
    get :new
    assert_response :success
  end

  test "should not get new post but redirect to root path when not logged in" do
    get :new
    assert_redirected_to root_path
  end

  test "should show post" do
    @post = valid_post
    get :show, :id => @post.to_param
    assert_response :success
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "index should show only last five posts" do
    @posts = (0...10).map{valid_post}
    get :index
    assert_equal @posts.last(5).reverse, assigns(:posts)
  end

  test "should get edit on selfsame post when logged in" do
    log_in
    @post = valid_post
    get :edit, :id => @post.to_param
    assert_response :success
  end

  test "should not get edit when not logged in, shunted to root path" do
    @post = valid_post
    get :edit, :id => @post.to_param
    assert_redirected_to root_path
  end

  test "should destroy post" do
    log_in
    @post = valid_post
    delete :destroy, :id => @post.to_param
    assert_equal 0, Post.count
    assert_redirected_to root_path
  end

  test "should not be able to destroy post, sent to index when not logged in" do
    @post = valid_post
    delete :destroy, :id => @post.to_param
    assert_equal 1, Post.count
    assert_redirected_to root_path
  end

  test "update should update post" do
    log_in
    @post = valid_post
    put :update, :id => @post.to_param
    assert_redirected_to post_path(@post)
  end

  test "update should change aspects of post" do
    log_in
    @post = valid_post
    put :update, :id => @post.to_param, :post => {:title => "Christ", :text => "No longer something a Norn would say."}
    @post.reload
    assert_equal "No longer something a Norn would say.", @post.text
    assert_equal "Christ", @post.title
  end

  test "posts with invalid input don't update and you get the edit page" do
    log_in
    @post = valid_post
    put :update, :id => @post.to_param, :post => {:title => ""}
    @post.reload
    assert_not_equal "", @post.title
    assert_template :edit
  end

  test "should not be able to update if not logged in, redirected to index" do
    @post = valid_post
    put :update, :id => @post.to_param, :post => {:title => "Christ", :text => "No longer something a Norn would say."}
    @post.reload
    assert_not_equal "No longer something a Norn would say.", @post.text
    assert_not_equal "Christ", @post.title
    assert_redirected_to root_path
  end

  test "if new post has valid input, create should save new post" do
    log_in
    post :create, :post => {:title => "walpyrge", :text => "dangerous ladies in the sky"}
    assert_not_nil Post.last
    assert_equal "walpyrge", Post.last.title
    assert_equal "dangerous ladies in the sky", Post.last.text
    assert_redirected_to posts_path
  end

  test "posts with invalid input cannot be created, show new form" do
    log_in
    post :create, :post => {:title => "", :text => ""}
    assert_nil Post.last
    assert_template :new
  end

  test "if not logged in, cannot create new post, redirected to root path" do
    post :create, :post => {:title => "walpyrge", :text => "dangerous ladies in the sky"}
    assert_nil Post.last
    assert_redirected_to root_path
  end

end
