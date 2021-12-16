require_relative 'Code_maker.rb'
require_relative 'Decryptor.rb'
require 'pry'

class MasterMind

  $end_game = false
  @count_steps = 0

  def self.start_game
    puts "Do you want to start a game y/n?"
    answer = gets.chomp
    if answer == "y" then nil else abort "Closing game..."; end
  end

  def self.code_check()
    @count_index = 0
    _count_color = 0
    for i in 0..3
      if $secret_code[i] == $code[i] then @count_index += 1; end
      if $code[i].include?($secret_code[i]) then _count_color += 1; end
    end
    @count_steps += 1
    print  "\n Complete match: #{@count_index} \n Match key: #{_count_color} \n Step: #{@count_steps} \n"
    MasterMind.check_win
  end

  def self.check_win
    if @count_steps == 12
      print "\n Code maker win! \n"
      $end_game = true
    elsif @count_index == 4
      print "\n Decryptor win! \n"
      $end_game = true
    end
  end
end


MasterMind.start_game
CodeMaker.create_code

until $end_game
  Decryptor.make_step
  MasterMind.code_check
end


