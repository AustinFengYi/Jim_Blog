class Carousel < ApplicationRecord
  belongs_to :category
  mount_uploader :image, ImageUploader
end
