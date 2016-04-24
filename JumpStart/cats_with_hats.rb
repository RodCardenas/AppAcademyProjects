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

# email your solution to jeff@appacademy.io


def position_of_cats_with_hats
  cats = []

  i = 0

#Populate array with cats with no hats
  while i < 100
    cats[i] = false
    i += 1
  end

  i = 0
  step = 1
#Outside loop defines which cats we will visit
  while step <= 100
    i = 0
    #Inside loop assigns and/or removes hats
    while i <= 100
      cats[i] = !cats[i]
      i += step
    end
    step += 1
  end

  cats_with_hats = []
  #Extracts which cats have hats
  cats.each_with_index do |cat, index|
    if cat == true
      cats_with_hats << index
    end
  end

  cats_with_hats
end

p position_of_cats_with_hats
