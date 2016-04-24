# I/O Exercises
#
# * Write a `guessing_game` method. The computer should choose a number between
#   1 and 100. Prompt the user to `guess a number`. Each time through a play loop,
#   get a guess from the user. Print the number guessed and whether it was `too
#   high` or `too low`. Track the number of guesses the player takes. When the
#   player guesses the number, print out what the number was and how many guesses
#   the player needed.
# You
#   could create a random number using the Random class, or you could use the
#   `shuffle` method in array.

def guessing_game
  chosen_num = Random.new.rand(100) + 1
  guesses = 0

  if chosen_num == 0 then  raise NoMoreInput end

  begin
    puts "Guess a number between 1 and 100:"
    guess = gets.chomp.to_i
    puts "#{guess}"

    if guess > chosen_num
      puts "too high"
    elsif guess < chosen_num
      puts "too low"
    end
    guesses += 1
  end until guess == chosen_num

  puts "You guessed right in #{guesses}! It was #{guess}"
end

#* Write a program that prompts the user for a file name, reads that file,
#   shuffles the lines, and saves it to the file "{input_name}-shuffled.txt".

def shuffle_file
  puts "Please enter the filename to open and create a shuffled copy of:"
  file_name = gets.chomp

  lines = File.readlines(file_name)

  lines = lines.shuffle

  file_name = file_name[0..-5]
  shuffled_file_name = "#{file_name}-shuffled.txt"

  shuffled_file = File.new("#{Dir.pwd}/#{shuffled_file_name}", "w+")
  File.open(shuffled_file, "w+") do |f|
    lines.each do |line|
      f.write line
    end
  end

  shuffled_file.close

  shuffled_file_name
end
