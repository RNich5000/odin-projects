class Player
  attr_accessor :name, :symbol, :moves_taken
  def initialize(name, symbol, moves_taken=[])
    @name = name
    @symbol = symbol
    @moves_taken = moves_taken
  end
end

$row_one = [1, 2, 3]
$row_two = [4, 5, 6]
$row_three = [7, 8, 9]

def interface
  puts '==='
  $row_one.each { |a| print a }; puts ''
  $row_two.each { |a| print a }; puts ''
  $row_three.each { |a| print a }; puts ''
  puts '==='
end

player_x = Player.new('Player X', 'X')
player_o = Player.new('Player O', 'O')
game_is_playing = true
possible_moves = [1, 2, 3, 4, 5, 6, 7, 8, 9]
current_player = player_x
win_combos = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]

puts 'Noughts and Crosses!'
while game_is_playing == true
  interface
  puts "#{current_player.name}'s turn"
  move = gets.chomp.to_i
  if possible_moves.include?(move)
    current_player.moves_taken.push(move)
    if move == 1 || move == 2 || move == 3
      $row_one.map! { |arg| arg == move ? current_player.symbol : arg }
    elsif move == 4 || move == 5 || move == 6
      $row_two.map! { |arg| arg == move ? current_player.symbol : arg }
    elsif move == 7 || move == 8 || move == 9
      $row_three.map! { |arg| arg == move ? current_player.symbol : arg }
    end
    game_is_over = win_combos.any? do |combo|
      combo.all? do |move|
        current_player.moves_taken.include?(move)
      end
    end
    if game_is_over
      game_is_playing = false
      puts interface
      puts "Game over! #{current_player.name} wins!"
    end
    possible_moves.delete(move)
    if current_player == player_x
      current_player = player_o
    elsif current_player == player_o
      current_player = player_x
    end
  else
    puts 'Invalid choice. Please try again:'
  end
  if possible_moves.empty? && game_is_over == false
    puts 'Stalemate! Try again later!'
  end
end
