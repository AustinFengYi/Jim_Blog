class Category < ApplicationRecord
  validates_presence_of :name
  has_many :blogs,dependent: :destroy
  has_one :carousel
end
