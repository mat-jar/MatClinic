class PeselParser

    def gender(pesel)
        if pesel[9].to_i.even?
            "female"
        else
            "male"
        end
    end

    def birth_date(pesel)
        year = year_from_pesel(pesel)
        month = month_from_pesel(pesel)
        day = pesel[4..5].to_i
         
        Date.new(year, month, day)
    end

    private

    def year_from_pesel(pesel)
        century = century_from_pesel(pesel)
        year_last_two_digits = pesel[0..1]

        "#{century}#{year_last_two_digits}".to_i
    end

    def month_from_pesel(pesel)
        pesel[2].to_i.even? ? first_digit = 0 : first_digit = 1
        second_digit = pesel[3]

        "#{first_digit}#{second_digit}".to_i
    end

    def century_from_pesel(pesel)
        case pesel[2]
        when '8', '9'
            18
        when '0', '1'
            19
        when '2', '3'
            20
        when '4', '5'
            21
        when '6', '7'
            22
        end
    end
  
  end