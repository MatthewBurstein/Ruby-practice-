def get_dice_symbol(value)
  case(value)
  when 1
    ";-("
  when 2
    ":-("
  when 3
    ":-|"
  when 4
    ":->"
  when 5
    ":-)"
  when 6
    ":-D"
  end
end

def roll_a_dice(player_number) #function to roll a dice - universal for each player ///
  puts "...rolling a dice..."
  sleep(0.5)
  player_roll = rand(6)+1
  puts "Player #{player_number} rolled #{player_roll}  #{get_dice_symbol(player_roll)}"
  return player_roll
end

def main()
  puts "How many rolls per player?"
  while true do #we make an infinite loop cause we want the user to type a valid statement.
    max_rounds = gets.chomp.to_i
    if max_rounds > 0 then
      break
    else
      puts "Type a valid number [1+]"
    end
  end

  puts "Roll your dice #{max_rounds} time#{max_rounds > 1 ? "s" : ""}"
  puts "*** Click enter to roll ***"
  puts

  player1_counter = 0
  player2_counter = 0
  rounds_counter = 1

  while rounds_counter <= max_rounds do
    puts "-------------------------- Round #{rounds_counter} --------------------------"
    gets
    player1_counter += roll_a_dice(1) #works for player 1  [when we call roll_a_dice for player 1, we get player's 1 score from function roll_a_dice]
    gets
    player2_counter += roll_a_dice(2) #works for player 2

    puts
    puts "** Player 1 has #{player1_counter} points **"
    puts "** Player 2 has #{player2_counter} points **"
    puts

    unless rounds_counter == max_rounds then
      if player1_counter > player2_counter then
        puts "PLAYER 1 IS WINNING"
      elsif player1_counter < player2_counter then
        puts "PLAYER 2 IS WINNING"
      else
        puts "We have a draw. Everybody is losing. Life is a miserable lie."
      end
    end
    rounds_counter += 1
  end

  if player1_counter > player2_counter then
    puts "--------> Player 1 won"
  elsif player1_counter < player2_counter then
    puts "--------> Player 2 won"
  else
    puts "--------> We have a draw. Everybody is losing. Life is a miserable lie."
  end

end

puts "Welcome to the Dice Game - the bigger number wins!" #the code above is just definitions to use for the computer if referenced. This is the first line to execute.

while true do  #This is the second line to execute (infinite loop :O)
  main() #main is a one game with n rolls. This is the third line to execute
  puts "If you want to play one more time, press Y and enter"

  input = gets.chomp

  if input == "Y" || input == "y" || input == "yes" then
    puts "!!! Let's do it !!!"
  else
    puts "gg no-re k lol coward"
    exit(0)
  end
end
