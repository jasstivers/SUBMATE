class Submarine < ApplicationRecord
  belongs_to :user
  has_one_attached :image_tag

  validates :name, :price, :submarine_class, :amenities, :description, :weight_ton, :prod_year, :speed, :image_tag, presence: true
end
