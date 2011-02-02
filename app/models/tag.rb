class Tag < ActiveRecord::Base

  attr_accessible :text

  belongs_to :post

  validates_presence_of :text
  validates_presence_of :post_id

end
