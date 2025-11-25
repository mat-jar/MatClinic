desc "Generate and save into db ten random doctors"
namespace :doctors do
  task :generate  => :environment do
    Faker::Config.locale = :pl
    10.times { Doctor.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name) }
  end
end 