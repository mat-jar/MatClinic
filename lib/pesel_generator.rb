# lib/pesel_generator.rb
module PeselGenerator
  def self.generate
  year = rand(1950..2024)
  month = rand(1..12)
  day   = rand(1..28)
  serial = rand(0..999)
  gender_digit = rand(0..9)

  month += case year
           when 1800..1899 then 80
           when 1900..1999 then 0
           when 2000..2099 then 20
           when 2100..2199 then 40
           when 2200..2299 then 60
           end
  base = "%02d%02d%02d%03d%d" % [year % 100, month, day, serial, gender_digit]

  weights = [1,3,7,9,1,3,7,9,1,3]
  sum = base.chars.map.with_index { |c,i| c.to_i * weights[i] }.sum
  checksum = (10 - sum % 10) % 10

  base + checksum.to_s
  
  end
end
