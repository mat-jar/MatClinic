json.extract! appointment, :id, :date, :time_slot, :price, :patient_id, :doctor_id, :created_at, :updated_at
json.url appointment_url(appointment, format: :json)
