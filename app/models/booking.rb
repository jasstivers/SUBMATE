class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :submarine

  enum status: { confirmed: 0, pending: 1, cancelled: 2 }
end
