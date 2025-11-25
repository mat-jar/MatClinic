require 'rails_helper'

RSpec.describe Doctor, type: :model do
  it "is valid with valid attributes" do
    expect(build(:doctor)).to be_valid
  end

  it "return formatted full name" do
    doctor = build(:doctor)
    expect(doctor.full_name).to eq "#{doctor.first_name} #{doctor.last_name}"
  end

  it "is invalid with invalid first_name" do
    expect(build(:doctor, first_name: "Mat3usz")).to be_invalid
  end

  it "is invalid with invalid last_name" do
    expect(build(:doctor, last_name: "Kowal8ki")).to be_invalid
  end
  
end
