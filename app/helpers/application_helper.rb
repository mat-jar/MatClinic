module ApplicationHelper
    def new_appointment_button(patient, css_class: '') 
        
        button_to(
            'New appointment',
            new_appointment_path,
            data: { turbo: false },
            method: :get,
            class: "btn #{css_class}",
            params: {patient_id: patient.id}
        )
    end

    def edit_appointment_button(appointment, patient, css_class: '') 
        
        button_to(
            'Edit appointment',
            edit_appointment_path(appointment),
            data: { turbo: false },
            method: :get,
            class: "btn #{css_class}",
            params: {patient_id: patient.id}
        )
    end
end
