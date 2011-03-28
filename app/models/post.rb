class Post < ActiveRecord::Base

  validates_presence_of :title, :length => { :minimum => 1, :maximum => 100 }
  validates_presence_of :text, :length => { :minimum => 1 }

  has_many :comments, :dependent => :destroy
  has_many :post_to_tag_connectors, :dependent => :destroy
  has_many :tags, :through => :post_to_tag_connectors

  def tag_texts=(tag_string)
    post_to_tag_connectors.destroy_all
    tag_array = tag_string.strip.split /, */
    tag_array.each do |tag_string|
      post_to_tag_connectors.build :tag_text => tag_string, :post => self
    end
  end

  def tag_texts
    tags.map{|t| t.text}.join(", ")
  end

end
