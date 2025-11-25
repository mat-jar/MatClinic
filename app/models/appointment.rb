class Appointment < ApplicationRecord
  belongs_to :patient
  belongs_to :doctor
  enum time_slot: 
    ["8:00", "8:20","8:40","9:00","9:20","9:40", "10:00","10:20","10:40",
    "11:00","11:20","11:40","12:00","12:20","12:40","13:00","13:20","13:40",
    "14:00","14:20","14:40","15:00","15:20","15:40"].map(&:to_sym)

  validates :date, :time_slot, :price,  presence: true
  validates :date, comparison: { greater_than_or_equal_to: Date.today }
  validates :price, comparison: { greater_than: 0 }
  validate :date_cannot_be_at_the_weekend
  validates :time_slot, uniqueness: { scope: [:patient_id, :date], message: "is invalid. A patient cannot have two appointments at the same time" }
  validates :time_slot, uniqueness: { scope: [:doctor_id, :date], message: "is invalid. A doctor cannot have two appointments at the same time" }

  def date_cannot_be_at_the_weekend
    if date&.on_weekend?
      errors.add(:date, "can't be at the weekend")
    end
  end

  def date_time
    date.to_datetime + Time.parse(time_slot).seconds_since_midnight.seconds
  end
end
