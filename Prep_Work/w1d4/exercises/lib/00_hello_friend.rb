class Friend
    def greeting (friend = nil)
        if friend.nil? then
            "Hello!"
        else
            "Hello, #{friend}!"
        end
    end
end
