class Collection < ActiveRecord::Base

  belongs_to :user
  has_many :imgs
  has_many :links
  accepts_nested_attributes_for :imgs, :links

end
