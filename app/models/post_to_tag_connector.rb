class PostToTagConnector < ActiveRecord::Base

  validates_presence_of :post
  validates_presence_of :tag

  belongs_to :post
  belongs_to :tag

  validates_uniqueness_of :post_id, :scope => :tag_id

  def tag_text=(tag_string)
    self.tag = Tag.find_by_text(tag_string)
    if self.tag.nil?
      self.tag = Tag.new(:text => tag_string)
    end
  end

  def tag_text
    self.tag.text
  end

end
