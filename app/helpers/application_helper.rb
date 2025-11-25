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
end
