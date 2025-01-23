class AddStartDatetimeAndEndDateToBookings < ActiveRecord::Migration[7.1]
  def change
    add_column :bookings, :start_datetime, :datetime
    add_column :bookings, :end_date, :datetime
  end
end
