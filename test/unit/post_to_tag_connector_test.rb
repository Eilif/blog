require 'test_helper'

class PostToTagConnectorTest < ActiveSupport::TestCase

  test 'must have both tag and post' do
    @pttc = PostToTagConnector.new
    @pttc.post = nil
    @pttc.tag = nil
    assert !@pttc.valid?
    assert_not_nil @pttc.errors[:post]
    assert_not_nil @pttc.errors[:tag]
  end

  test 'tag/post combo must be unique' do
    p = Post.create!(:title => "Garmr", :text => "Dog what guards Hel.")
    t = Tag.create!(:text => "mythical puppies")
    pttc_valid = PostToTagConnector.create!(:post => p, :tag => t)
    pttc_not_valid = PostToTagConnector.new(:post => p, :tag => t)
    assert !pttc_not_valid.valid?
    assert_not_nil pttc_not_valid.errors[:post_id]
  end

end
