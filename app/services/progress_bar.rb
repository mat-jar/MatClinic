class ProgressBar

    def initialize(total)
        @total   = total
        @counter = 1
    end
  
    def increment
        complete = sprintf("%#.2f%%", ((@counter.to_f / @total.to_f) * 100))
        print "\r\033[0K#{@counter}/#{@total} (#{complete})"
        @counter += 1
    end

    def finish
        print "\r\033[0K Task finished! #{@total}/#{@total} (100%) \n"
    end
  
  end