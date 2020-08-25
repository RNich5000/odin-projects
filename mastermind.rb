class Code
  attr_accessor :numbers

  def initialize(numbers=[])
    @numbers = numbers
  end

end

code = Code.new()
interface = Hash.new
$guess_amt = 0
game_is_playing = true

4.times do |num|
  num = rand(1 .. 6)
  new_num = num.to_s
  code.numbers.push(new_num)
end

puts ''
puts 'Welcome to Mastermind!'
puts 'Enter four numbers from 1-6 as your guess.'
puts 'A number may appear in the code multiple times.'
puts 'The computer will give you clue for each number that you wrote.'
puts "If the number isn't in the code at all, your clue will be 'x'"
puts "If the number is in the code, but not in that spot, your clue will be '-'"
puts "If the number is in the right spot, your clue will be '='"

while game_is_playing == true
  puts 'What do you think the code might be? Enter your guess:'
  guess = gets.chomp
  if guess =~ /^-?[1-6]+$/ && guess.length == 4
    guess_array = guess.split("")
      # todo: limit the acceptable input to 1-6
      # todo: if input is unacceptable, create error message and get new input
    clue = Array.new
    element = 0
    guess_array.each do |num|
      if code.numbers[element] == guess_array[element]
        symbol = "="
        clue.push(symbol)
      elsif code.numbers.any?(num)
        symbol = "-"
        clue.push(symbol)
      else clue.push("x")
      end
      element += 1
    end

    $guess_amt += 1
    clue_string = clue.join
    interface[$guess_amt] = guess + " || " + clue_string
    puts '======================================================'
    puts interface.values

    if clue_string == "====" && $guess_amt == 1
      game_is_playing = false
      puts 'Congratulations! You won in your first guess!'
    elsif clue_string == "===="
      game_is_playing = false
      return puts 'Congratulations! You won in ' + $guess_amt.to_s + ' turns!'
    end

    if $guess_amt > 11
      game_is_playing = false
      puts 'Game over. Try again another time!'
    end
  else puts "Invalid input. Please only use four numbers 1-6."
  end

end
