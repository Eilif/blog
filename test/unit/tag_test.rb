require 'test_helper'

class TagTest < ActiveSupport::TestCase

  test 'tags must have text' do
    t = Tag.new
    t.text = 'charcuterie'
    assert_equal 'charcuterie', t.text
  end

  test 'tags must be unique' do
    t1 = Tag.create!(:text => "sun chariot")
    t2 = Tag.new(:text => "sun chariot")
    assert !t2.valid?
  end

  test 'tags can have many posts' do
    p1 = Post.create!(:title => "Beasties", :text => "Who are the wolves who chase the sun?")
    p2 = Post.create!(:title => "Wolves", :text => "Does Fenrir in spirit or actuality chase the sun?")
    t = Tag.create!(:text => "mythical puppies")
    PostToTagConnector.create!(:post => p1, :tag => t)
    PostToTagConnector.create!(:post => p2, :tag => t)
    assert_equal [p1, p2], t.posts
  end

  test 'when a tag is destroyed its relationship to a post dies too' do
    p = Post.create!(:title => "Hel's Ceiling", :text => "Laced with the roots of Yggdrasil.")
    t = Tag.create!(:text => "roots")
    pttc = PostToTagConnector.create! :tag => t, :post => p
    t.destroy
    assert_nil PostToTagConnector.find_by_id(pttc.id)
    assert_equal "Hel's Ceiling", Post.find(t.id).title
  end

end
