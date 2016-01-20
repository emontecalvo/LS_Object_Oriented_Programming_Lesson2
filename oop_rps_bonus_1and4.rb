class Move
  VALUES = ['rock', 'paper', 'scissors']

  def initialize(value)
    @value = value
  end

  def scissors?
    @value == 'scissors'
  end

  def rock?
    @value == 'rock'
  end

  def paper?
    @value == 'paper'
  end

  def >(other_move)
    (rock? && other_move.scissors?) ||
      (paper? && other_move.rock?) ||
      (scissors? && other_move.paper?)
  end

  def <(other_move)
    (rock? && other_move.paper?) ||
      (paper? && other_move.scissors?) ||
      (scissors? && other_move.rock?)
  end

  def to_s
    @value
  end
end

class Player
  attr_accessor :move, :name

  def initialize
    set_name
  end
end

class Human < Player
  attr_accessor
  def set_name
    n = ''
    loop do
      puts "What's your name?"
      n = gets.chomp
      break unless n.empty?
      puts "Sorry, must enter a value."
    end
    self.name = n
  end

  def choose
    choice = nil
    loop do
      puts "Please choose rock, paper or scissors:"
      choice = gets.chomp
      break if Move::VALUES.include? choice
      puts "Sorry, invalid choice."
    end
    self.move = Move.new(choice)
  end
end

class Computer < Player
  attr_accessor
  def set_name
    self.name = ['R2D2', 'Hal', 'Data', 'Johnny 5'].sample
  end

  def choose
    self.move = Move.new(Move::VALUES.sample)
  end
end

class RPSGame
  attr_accessor :human, :computer, :human_score, :computer_score, :human_history, :computer_history

  def initialize
    @human = Human.new
    @computer = Computer.new
    @human_score = 0
    @computer_score = 0
    @human_history = []
    @computer_history = []
  end

  def display_winner
    if human.move > computer.move
      puts "#{human.name} won!"
      @human_score += 1
    elsif human.move < computer.move
      puts "#{computer.name} won!"
      @computer_score += 1
    else
      puts "It's a tie!"
    end
  end

  def play_again?
    answer = nil # initalize answer for the scope to acess
    loop do
      @human_history << human.move.to_s
      @computer_history << computer.move.to_s
      puts "Your move history so far: #{human_history}"
      puts "#{computer.name} history so far: #{computer_history}"
      puts "Would you like to play again? y/n"
      answer = gets.chomp
      break if ['y', 'n'].include? answer.downcase
      puts "Sorry, must be y or n."
    end

    return true if answer == 'y'
    false
  end

  def display_welcome_message
    puts "Welcome to Rock, Paper, Scissors!"
  end

  def display_goodbye_message
    puts "Thanks for playing Rock, Paper, Scissors!"
  end

  def display_moves
    puts "#{human.name} chose #{human.move}."
    puts "#{computer.name} chose #{computer.move}."
  end

  def play
    display_welcome_message

    loop do
      human.choose
      computer.choose
      display_moves
      display_winner
      puts "Your score so far is: #{human_score}."
      puts "Computer score so far is: #{computer_score}."
      if @human_score == 10
        puts "You're the first one to 10 points, you won! Goodbye!"
        break
      elsif @computer_score == 10
        puts "#{computer.name} is the first one to 10 points, he wins! Goodbye!"
        break
      end
      break unless play_again?
    end
    display_goodbye_message
  end
end

RPSGame.new.play
