class Book
    def title=(title)
        exceptions = [
            "and",
            "or",
            "in",
            "the",
            "a",
            "of",
            "an"
        ]

        words = title.split(" ")
        treated_words = words.map do |word|
            if exceptions.include? word
                word
            else
                word.capitalize
            end
        end

        treated_words.first.capitalize!
        @title = treated_words.join(" ")
    end

    def title
        @title
    end
end
