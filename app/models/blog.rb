class Blog < ApplicationRecord
  validates_presence_of :title,:date 
  belongs_to :category, optional: true

  mount_uploader :image, ImageUploader
end
