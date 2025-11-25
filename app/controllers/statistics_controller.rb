class StatisticsController < ApplicationController
  def show
    @birth_years_rates = StatisticsGenerator.new.birth_years_rates
  end
end
