require 'test_helper'

class PostTest < ActiveSupport::TestCase

  test 'posts can have title' do
    p = Post.new
    p.title = 'tipple'
    assert_equal 'tipple', p.title
  end

  test 'post titles must within 1-100 characters' do
    p = Post.new
    ["This is the hypothetical long post title that would look ugly on the page if I allowed it to happen, but since I will be the only author on this blog, the limit is a little ridiculous and is only in place because it's good to practice technique.", ""].each do |title|
      p.title = title
      assert !p.valid?
    end
  end

  test 'posts can have text' do
    p = Post.new
    p.text = "Hei Maailma!"
    assert_equal "Hei Maailma!", p.text
  end

  test 'posts must be 1 character or longer' do
    p = Post.new
    p.text = ""
    assert !p.valid?
  end

  test 'posts can have many tags' do
    p = valid_post
    ["roots", "trunk", "branches"].each do |tag_text|
      t = Tag.create!(:text => tag_text)
      PostToTagConnector.create! :tag => t, :post => p
    end
    p.reload
    assert_equal 3, p.tags.count
    assert_equal "trunk", p.tags.second.text
  end

  test 'when post is deleted, its relation to tags is destroyed but tags remain' do
    p = Post.create!(:title => "Hel's Ceiling", :text => "Laced with the roots of Yggdrasil.")
    t = Tag.create!(:text => "roots")
    pttc = PostToTagConnector.create! :tag => t, :post => p
    p.destroy
    assert_nil PostToTagConnector.find_by_id(pttc.id)
    assert_equal "roots", Tag.find(t.id).text
  end

  test 'tag names outputs the same number of post to tag connectors as the number of tags separated by commas and spaces it receives.' do
    p = Post.create!(:title => "Hel's Ceiling", :text => "Laced with the roots of Yggdrasil.", :tag_texts => "world tree, Hel, roots")
    assert_equal 3, p.post_to_tag_connectors.count
  end

  test 'tag names splits tags correctly when assigning to post' do
    p = Post.create!(:title => "Hel's Ceiling", :text => "Laced with the roots of Yggdrasil.", :tag_texts => "world tree, Hel, roots")
    assert_equal "world tree", p.tags.first.text
    assert_equal "roots", p.tags.last.text
  end

end
