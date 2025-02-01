class Submarine < ApplicationRecord
  belongs_to :user

  has_many_attached :photos

  validates :name, :price, :submarine_class, :amenities, :description, :weight_ton, :prod_year, :speed, :photos, presence: true
end
