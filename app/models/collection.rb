class Collection < ActiveRecord::Base

  belongs_to :user
  has_many :imgs, dependent: :destroy
  has_many :links, dependent: :destroy
  accepts_nested_attributes_for :imgs, :links

end
