ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'authlogic/test_case'

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

  def valid_user
    u = User.new
    u.login = "Urd"
    u.password = "squid"
    u.save!
    u
  end

  def log_in
    UserSession.create!(valid_user)
  end

  def setup
    activate_authlogic
  end

  def self.pending(name)
    test(name){pending}
  end
end
