class Tag < ActiveRecord::Base

  attr_accessible :text

  has_many :post_to_tag_connectors, :dependent => :destroy
  has_many :posts, :through => :post_to_tag_connectors

  validates_presence_of :text
  validates_uniqueness_of :text

end
