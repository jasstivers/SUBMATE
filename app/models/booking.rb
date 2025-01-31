class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :submarine

  enum status: { confirmed: 0, pending: 1, rejected: 2 }

  # Validations
  validates :start_datetime, :end_date, presence: true
  validate :end_after_start

  private

  # Custom validation to ensure the end time is after the start time
  def end_after_start
    return if end_date.blank? || start_datetime.blank?

    if end_date <= start_datetime
      errors.add(:end_date, "must be after the start datetime")
    end
  end
end
