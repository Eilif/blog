class PostToTagConnector < ActiveRecord::Base

  validates_presence_of :post
  validates_presence_of :tag

  belongs_to :post
  belongs_to :tag

  validates_uniqueness_of :post_id, :scope => :tag_id

end
