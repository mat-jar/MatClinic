class AddUniqueIndexToAppointmentForPatients < ActiveRecord::Migration[7.0]
  def change
    add_index :appointments, [:time_slot, :date, :patient_id], unique: true, name: 'appointments_unique_index_for_patients'
  end
end
