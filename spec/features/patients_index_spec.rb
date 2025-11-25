require 'rails_helper'

RSpec.describe 'Patients', type: :system do
  describe 'index page' do
    it 'shows the right content' do
      visit patients_path
      expect(page).to have_content('Patients')
    end
  end
end