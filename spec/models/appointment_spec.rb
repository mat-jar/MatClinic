require 'rails_helper'

RSpec.describe Appointment, type: :model do
  it "is valid with valid attributes" do
    expect(build(:appointment)).to be_valid
  end

  it "return formatted date_time" do
    appointment = build(:appointment)
    expect(appointment.date_time).to eq appointment.date.to_datetime + Time.parse(appointment.time_slot).seconds_since_midnight.seconds
  end

  it "is invalid with invalid price" do
    expect(build(:appointment, price: "-20")).to be_invalid
  end

  it "is invalid with date in the past" do
    expect(build(:appointment, date: Date.today-5)).to be_invalid
  end

  it "is invalid with invalid time_slot" do
    expect { build(:appointment, time_slot: "8:15") }.to raise_error(ArgumentError)
  end

  it "is invalid with date at the weekend" do
    expect(build(:appointment, date: Date.new(2025, 04, 13))).to be_invalid
  end
end
