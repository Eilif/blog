class Comment < ActiveRecord::Base

  belongs_to :post

  attr_accessible :comment_text, :creator_alias, :creator_email
  
  validates_presence_of :comment_text, :length => {:minimum => 1, :maximum => 3000 }
  validates_presence_of :creator_alias, :creator_email
  validates_format_of :creator_email, :with => /^[^\s@]+@[^\s@]+\.[^\s@]{2,}$/
  validates_presence_of :post

end
