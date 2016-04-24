class Timer

    def initialize
        @seconds = 0
    end

    def seconds=(seconds)
        @seconds = seconds
    end

    def seconds
        @seconds
    end

    def time_string
        s = @seconds
        hrs = s / 3600
        s -= hrs*3600
        mins = s / 60
        s -= mins*60

        "#{padded(hrs)}:#{padded(mins)}:#{padded(s)}"
    end

    def padded (n)
        if n >= 10 then
            return n.to_s
        else
            return "0#{n}"
        end
    end

end
