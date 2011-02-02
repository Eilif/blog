require 'test_helper'

class TagsTest < ActiveSupport::TestCase
  
  test 'tags must belong to post' do
    t = Tag.new
    t.text = 'whinging'
    t.post = nil
    assert !t.valid?
  end

  test 'tags must have text' do
    t = Tag.new
    t.text = 'charcuterie'
    assert_equal 'charcuterie', t.text
  end
end
