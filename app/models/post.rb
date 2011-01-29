class Post < ActiveRecord::Base

  attr_accessible :title, :text

  validates_presence_of :title, :length => { :minimum => 1, :maximum => 100 }
  validates_presence_of :text, :length => { :minimum => 1 }

  has_many :comments, :dependent => :destroy
  #has_many :tags

end
