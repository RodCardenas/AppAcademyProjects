class Temperature
    def initialize (temp = {})
        if temp.has_key?(:c)
            @temperature = temp[:c]
            @scale = "c"
        elsif temp.has_key?(:f)
            @temperature = temp[:f]
            @scale = "f"
        end
    end

    def in_fahrenheit
        if @scale == "c"
            Temperature.ctof(@temperature)
        elsif @scale == "f"
            @temperature
        end
    end

    def in_celsius
        if @scale == "f"
            Temperature.ftoc(@temperature)
        elsif @scale == "c"
            @temperature
        end
    end

    def Temperature.from_celsius(degrees)
        Temperature.new(:c => degrees)
    end

    def Temperature.from_fahrenheit(degrees)
        Temperature.new(:f => degrees)
    end

    def Temperature.ftoc(temp)
        (temp - 32) * 5.0 / 9.0
    end

    def Temperature.ctof(temp)
        temp * 9.0 / 5.0 + 32
    end

end

class Celsius < Temperature
    def initialize (degrees)
        super :c => degrees
    end
end

class Fahrenheit < Temperature
    def initialize (degrees)
        super :f => degrees
    end
end
