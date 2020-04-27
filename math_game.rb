
class Player
  attr_accessor :lives, :name
  def initialize(name)
    @name = name
    @lives = 3
  end
end

class Game 
  attr_accessor :p1, :p2, :currPlayer
  def initialize(p1, p2)
    @p1 = p1
    @p2 = p2
    @currPlayer = p1
  end

  # check it the player gave the right answer
  def isCorrect(num1, num2, op, answer)
    true if (op == "plus" && answer.to_i == num1.to_i + num2.to_i) || (op == "minus" && answer.to_i == num1.to_i - num2.to_i) 
      
  end

  def correct
    puts "#{@currPlayer.name}: Too right you are!"
  end

  def wrong 
    puts "#{@currPlayer.name}: Wrong, dummy!"
    @currPlayer.lives -= 1
  end

  def newTurn
    puts "P1: #{@p1.lives}/3 vs #{@p2.lives}/3"
    puts "-------NEW TURN-------"
    @currPlayer == @p1 ? @currPlayer = @p2 : @currPlayer = @p1
  end

  def winner
    @currPlayer == @p1 ? winner = @p2 : winner = @p1
    puts "#{winner.name} wins with a score of #{winner.lives}/3"
    puts "Good bye!!"
  end
end

print "Player 1 Enter Name > "
name1 = $stdin.gets.chomp

print "Player 2 Enter Name > "
name2 = $stdin.gets.chomp

player1 = Player.new(name1)
player2 = Player.new(name2)

game = Game.new(player1, player2)

while game.p1.lives > 0 && game.p1.lives > 0
  num1 = rand(20)
  num2 = rand(20)
  op = ["plus", "minus"][rand(2)]
  
  puts "#{game.currPlayer.name}: What is #{num1} #{op} #{num2}?"
  print ">"
  answer = $stdin.gets.chomp
  game.isCorrect(num1, num2, op, answer) ? game.correct : game.wrong 

  game.currPlayer.lives == 0 ? game.winner : game.newTurn

end

