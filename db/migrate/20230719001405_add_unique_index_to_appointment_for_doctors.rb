class AddUniqueIndexToAppointmentForDoctors < ActiveRecord::Migration[7.0]
  def change
    add_index :appointments, [:time_slot, :date, :doctor_id], unique: true, name: 'appointments_unique_index_for_doctors'
  end
end
