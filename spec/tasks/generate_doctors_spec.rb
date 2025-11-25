require "rails_helper"
Rails.application.load_tasks

describe "generate_doctors.rake" do
    it "generates and saves to db ten random doctors" do
      Rake::Task["doctors:generate"].execute
      expect(Doctor.all.count).to eq 10
    end
  end