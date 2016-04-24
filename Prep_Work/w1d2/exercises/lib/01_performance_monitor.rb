def measure (num = 1)
    average_time = 0
    num.times do
        start_time = Time.now
        yield
        end_time = Time.now
        average_time += end_time - start_time
    end

    average_time / num
end
