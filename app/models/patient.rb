class Patient < ApplicationRecord
    has_many :appointments, dependent: :destroy
    
    enum gender: { female: 'female', male: 'male'}
    #before_save :upcase_first_name, :upcase_last_name, :upcase_city

    validates :first_name, :last_name, :gender, :birth_date, :pesel, :city, presence: true
    validates :birth_date, comparison: { less_than_or_equal_to: Date.today, message: "Birth date cannot be greater than #{Date.today} (today)" }
    validates :pesel, uniqueness: true
    validates :pesel, format: { with: /\A\d{11}\z/, message: "must consist of eleven digits" }
    validates :first_name, :last_name, :city, format: { with: /\A\D*\z/, message: "cannot contain any digits" }

    def self.ransackable_attributes(auth_object = nil)
        ["birth_date", "gender", "last_name"]
    end

    def full_name
        "#{first_name.capitalize} #{last_name}"
    end

    def upcase_first_name
        self.first_name = self.first_name.upcase
    end

    def upcase_last_name
        self.last_name = self.last_name.upcase
    end

    def upcase_city
        self.city = self.city.upcase
    end
end
