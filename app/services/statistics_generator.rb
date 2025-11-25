class StatisticsGenerator
    def birth_years_rates
        birth_years_tally = Patient.pluck(:birth_date).map {|bd| bd.year}.tally
        birth_years_sorted_hashes = birth_years_tally.map { |k,v| {year: k, count: v} }.sort_by {|hash| hash[:year]}
    end
end