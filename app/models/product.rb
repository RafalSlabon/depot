class Product < ActiveRecord::Base

  default_scope :order => 'title'


  validates :title, :uniqueness => true
  validates_length_of :title, :minimum => 4, :message => "title is too short(<4)"
  validates :title, :description, :image_url, :presence => true
  validates :price, :numericality => {:greater_than_or_equal_to => 0.01}
  validates :image_url, :format => {
      :with => %r{\.(gif|jpg|png)$}i,
      :message => 'must be a URL for GIF, JPG or PNG image'
  }
end
