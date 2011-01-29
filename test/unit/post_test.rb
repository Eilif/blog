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

end
