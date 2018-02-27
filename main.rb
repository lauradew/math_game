require_relative 'players'
require_relative 'questions'


class Game
  def initialize
    puts "---------BEGIN GAME-----------"
    puts "Player 1's name: "
    player_1_name = gets.chomp
    puts "Player 2's name: "
    player_2_name = gets.chomp

    @player_1 = Players.new(player_1_name)
    @player_2 = Players.new(player_2_name)

    @current_player = @player_1
    @other_player = @player_2

    while (@player_1.alive? && @player_2.alive?) do
      play_turn
      switch_player
    end

    if @player_1.lives == 0
      puts "#{@player_2.name} wins!!!!!!!!!!"
      puts "-------------GAME OVER--------------"
    elsif @player_2.lives == 0
      puts "#{@player_1.name} wins!!!!!!!!!!"
      puts "-------------GAME OVER--------------"
    end
  end

  def play_turn
    puts "\n-------------NEW Q---------------\n"
    puts "#{@current_player.name} to play:"
    @question = Questions.new
    answer = gets.chomp.to_i

    if answer == @question.answer
      puts "Correct."
      puts "#{@current_player.name} #{@current_player.lives}/3 lives and #{@other_player.name} #{@other_player.lives}/3 lives"
    else
      puts "Seriously? No."
      @current_player.lives = @current_player.lives - 1
      puts "#{@current_player.name} #{@current_player.lives}/3 lives and #{@other_player.name} #{@other_player.lives}/3 lives"
    end
  end

  def switch_player
    @current_player = @current_player == @player_1 ? @player_2 : @player_1
    @other_player = @other_player == @player_2 ? @player_1 : @player_2
  end

end

Game.new