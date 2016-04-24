#### Five Sort ####
    # Write a function that recieves an array of numbers as an argument.
    # It should return the same array with the fives moved to the end.
    # The ordering of the other elements should remain unchanged.
    #
    # For example:
    # nums = [1, 5, 3, 5, 5, 2, 3]
    # sorted = five_sort(nums)
    # sorted #=> [1, 3, 2, 3, 5, 5, 5]
    #
    # Rules
    # * You may not, at any time, create a new array.
    # * You are only permitted to use a 'while' loop
    # * You are not permitted to call any methods on the array. Only the
    # use of [], []=, and length are permitted.

def five_sort(nums)
  i = 0
  fives = 0

  while i < nums.size - fives
    if nums[i] == 5
      j = i
      while j < nums.size
        nums[j] = nums[j+1]
        j += 1
      end

      nums[-1] = 5
      fives += 1
    end

    i += 1 unless nums[i] == 5
  end

  nums
end

p five_sort([1, 5, 3, 5, 5, 2, 3])

### Cats 'n Hats ###
      # You have 100 cats (You are quite lucky to own so many cats!).

      # You have arranged all your cats in a line. Initially, none of your cats
      # have any hats. You take 100 rounds walking around the cats, always starting
      # at the beginning. Every time you stop at a cat, you put a hat on it if it
      # doesn't have one, and you take its hat off if it has one on.

      # The first round, you stop at every cat. The second round, you only stop at
      # every 2nd cat (#2, #4, #6, #8, etc.). The third round, you only stop at
      # every 3rd cat (#3, #6, #9, #12, etc.). You continue this process until the
      # 100th round (i.e. you only visit the 100th cat).

      # Write a program that prints which cats have hats at the end.
