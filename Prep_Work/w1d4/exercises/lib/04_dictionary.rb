class Dictionary

    def initialize
        @entries = {}
    end

    def entries
        @entries
    end

    def add (hash = {})
        if hash.is_a?String
            @entries[hash] = nil
        else
            hash.each do |k,v|
                @entries[k] = v
            end
        end
    end

    def keywords
        @entries.keys.sort
    end

    def find (prefix)
        result = {}
        keys = @entries.keys

        keys.each do |key|
            if key.include?prefix then
                result[key] =  @entries[key]
            end
        end
        result
    end

    def include? (keyword)
        @entries.include?keyword
    end

    def printable
        text = ""
        keywords.each do |k|
            text += "[#{k}] \"#{@entries[k]}\"\n"
        end
        text[0..-2]
    end

end
