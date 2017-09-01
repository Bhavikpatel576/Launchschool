# Rock Papper Scisoors
# The user makes a choice
# The computer makes a choice
# The winner is displayed

VALID_CHOICES = 
{
	r: 'Rock',
	p: 'Paper',
	s: 'Scissors',
	l: 'Lizard',
	k: 'Spock'
}

def prompt(message)
  puts("=>#{message}")
end

def win?(first, second)
  (first == 'Rock' && second == 'Scissors') ||
  (first == 'Rock' && second == 'Lizard') ||
  (first == 'Scissors' && second == 'Paper') ||
  (first == 'Scissors' && second == 'Lizard')
  (first == 'Paper' && second == 'Rock') ||
  (first == 'Paper' && second == 'Spock')
  (first == 'Lizard' && second == 'Paper') ||
  (first == 'Lizard' && second == 'Spock') ||
  (first == 'Spock' && second == 'Rock') ||
  (first == 'Spock' && second == 'Scissors')
end

def display_result(player, computer)
  p win?(player, computer)
  p win?(computer, player)

  if win?(player, computer)
    prompt('you won')
  elsif win?(computer, player)
    prompt('Computer won')
  else
    prompt('It was a tie and something went wrong')
  end
end

prompt('Welcome to the RPS-SPOCK-LAZARD!')
response = Kernel.gets.chomp
p response

	choice = ''

	loop do
	  prompt("Choose one: #{VALID_CHOICES.join(', ')}")
	  choice = gets.chomp.downcase.capitalize!
	  break if VALID_CHOICES.include?(choice)
	  prompt("That's not a valid choice")
	end

	computer_choice = %w(Rock Paper Scissors Spock Lizard).sample
	prompt("You chose #{choice} and the computer chose #{computer_choice}")

	player_points = 0
	computer_points = 0
	display_result(choice, computer_choice)

	if (display_result(choice, computer_choice) == 'you won')
		player_points += 1
	else
		computer_points += 1
	end

	prompt('Current score - You: #{player_points} & Computer #{computer_points}')

	#break if player_points || computer_points == 5



