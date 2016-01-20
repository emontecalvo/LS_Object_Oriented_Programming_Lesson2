class Move
  VALUES = ['rock', 'paper', 'scissors', 'lizard', 'spock']
end

class Rock < Move
  def >(other_move)
    other_move.is_a?(Scissors || Lizard)
  end

  def <(other_move)
    other_move.is_a?(Paper || Spock)
  end

  def to_s
    'rock'
  end
end

class Paper < Move
  def >(other_move)
    other_move.is_a?(Rock || Spock)
  end

  def <(other_move)
    other_move.is_a?(Scissors || Lizard)
  end

  def to_s
    'paper'
  end
end

class Scissors < Move
  def >(other_move)
    other_move.is_a?(Paper || Lizard)
  end

  def <(other_move)
    other_move.is_a?(Rock || Spock)
  end

  def to_s
    'scissors'
  end
end

class Lizard < Move
  def >(other_move)
    other_move.is_a?(Spock || Paper)
  end

  def <(other_move)
    other_move.is_a?(Scissors || Rock)
  end

  def to_s
    'lizard'
  end
end

class Spock < Move
  def >(other_move)
    other_move.is_a?(Scissors || Rock)
  end

  def <(other_move)
    other_move.is_a?(Lizard || Paper)
  end

  def to_s
    'spock'
  end
end

class Player
  attr_accessor :my_move, :name

  def initialize
    set_name
  end
end

class Human < Player
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
      puts "Please choose rock, paper, scissors, lizard or spock:"
      choice = gets.chomp
      break if Move::VALUES.include? choice
      puts "Sorry, invalid choice."
    end
    if choice == 'rock'
      self.my_move = Rock.new # create a new rock and put it in self.move
    elsif choice == 'paper'
      self.my_move = Paper.new
    elsif choice == 'scissors'
      self.my_move = Scissors.new
    elsif choice == 'lizard'
      self.my_move = Lizard.new
    elsif choice == 'spock'
      self.my_move = Spock.new
    end
  end
end

class Computer < Player
  attr_accessor
  def set_name
    self.name = ['R2D2', 'Hal', 'Data', 'Johnny 5'].sample
  end

  def choose
    choice = Move::VALUES.sample
    if choice == 'rock'
      self.my_move = Rock.new
    elsif choice == 'paper'
      self.my_move = Paper.new
    elsif choice == 'scissors'
      self.my_move = Scissors.new
    elsif choice == 'lizard'
      self.my_move = Lizard.new
    elsif choice == 'spock'
      self.my_move = Spock.new
    end
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
    if human.my_move > computer.my_move
      # the > here is a FUNCTION call - operator overload
      # this is calling the > function in rock/paper/scissors - operator overload
      puts "#{human.name} won!"
      @human_score += 1
    elsif human.my_move < computer.my_move
      puts "#{computer.name} won!"
      @computer_score += 1
    else
      puts "It's a tie!"
    end
  end

  def play_again?
    answer = nil # initalize answer for the scope to acess
    loop do
      @human_history << human.my_move.to_s
      @computer_history << computer.my_move.to_s
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
    puts "Welcome to Rock, Paper, Scissors, Lizard, Spock!"
  end

  def display_goodbye_message
    puts "Thanks for playing Rock, Paper, Scissors, Lizard, Spock!"
  end

  def display_moves
    puts "#{human.name} chose #{human.my_move}."
    puts "#{computer.name} chose #{computer.my_move}."
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
