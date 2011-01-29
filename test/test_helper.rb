ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase

  def valid_post
    p = Post.new
    p.title = "Consulting Skuld"
    p.text = "Wild times riding through the sky and this or that."
    p.save!
    p
  end

  def valid_comment
      c = Comment.new
      c.creator_alias = "Verthandi"
      c.creator_email = "verthandi@gmail.com"
      c.comment_text = "I've measured your thread, just so you know."
      c.post = valid_post
      c.save!
      c
  end
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  # Add more helper methods to be used by all tests here...
end
