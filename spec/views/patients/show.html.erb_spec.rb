require 'rails_helper'

RSpec.describe "patients/show", type: :view do
  before(:each) do
    assign(:patient, create(:patient))
  end

  it "renders attributes in <p>" do
    render
  end
end
