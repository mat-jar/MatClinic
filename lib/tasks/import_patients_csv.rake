require 'csv'
desc "Import patients info from a CSV file (filename passed as CSV_FILE env var)"
namespace :patients do
  task :import  => :environment do
    if filename = ENV['CSV_FILE']
      lines_count = `wc -l #{filename}`.to_i
      progress_bar = ProgressBar.new(lines_count)
      CSV.foreach(filename, headers: true) do |row|
        patient = Patient.new(row.to_hash)
        patient.gender = PeselParser.new.gender(patient.pesel)
        patient.birth_date = PeselParser.new.birth_date(patient.pesel)
        patient.save!
        progress_bar.increment
      end
      progress_bar.finish
    else
      puts 'No filename given, use "rake patients:import CSV_FILE=filename.csv" '
    end
  end

  task :count  => :environment do
    if filename = ENV['CSV_FILE']
      puts `wc -l #{filename}`.to_i
    else
      puts 'No filename given, use "rake patients:import CSV_FILE=filename.csv" '
    end
  end
end 