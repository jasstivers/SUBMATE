class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :submarine

  enum status: { confirmed: 0, pending: 1, cancelled: 2 }

  # Validations
  validates :start_datetime, :end_datetime, presence: true
  validate :end_after_start

  private

  # Custom validation to ensure the end time is after the start time
  def end_after_start
    return if end_datetime.blank? || start_datetime.blank?

    if end_datetime <= start_datetime
      errors.add(:end_datetime, "must be after the start datetime")
    end
  end
end
