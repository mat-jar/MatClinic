require 'rails_helper'

RSpec.describe Patient, type: :model do
  it "is valid with valid attributes" do
    expect(build(:patient)).to be_valid
  end

  it "return formatted full name" do
    patient = build(:patient)
    expect(patient.full_name).to eq "#{patient.first_name} #{patient.last_name}"
  end

  it "is invalid with invalid first_name" do
    expect(build(:patient, first_name: "Mat3usz")).to be_invalid
  end

  it "is invalid with invalid last_name" do
    expect(build(:patient, last_name: "Kowal8ki")).to be_invalid
  end
end
