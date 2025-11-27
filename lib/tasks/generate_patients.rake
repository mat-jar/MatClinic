desc "Generate and save into db 50 random patients"
namespace :patients do
  task :generate  => :environment do
    Faker::Config.locale = :pl

    male_names = %w[Adam Andrzej Bartosz Dawid Jakub Jan Kamil Krzysztof Łukasz Marcin Michał Paweł Piotr Tomasz]
female_names = %w[Agnieszka Anna Barbara Ewa Joanna Katarzyna Kinga Magdalena Maria Monika Sylwia]

    50.times { 
      pesel = PeselGenerator.generate
      gender = PeselParser.new.gender(pesel)
      birth_date = PeselParser.new.birth_date(pesel)
      
      first_name = gender == "male" ? male_names.sample : female_names.sample

      Patient.create!(
        first_name: first_name,
        last_name: Faker::Name.last_name,
        gender: gender,
        birth_date: birth_date,
        pesel: pesel,
        city: Faker::Address.city
      )}
  end
end