# This is a simple demo for Rock, Paper, Sissor game
# Made on 2016/10/17 , by Atlas Huamg
class Player
  attr_accessor :name, :gesture
  def initialize(name)
    @name = name
    @gesture = 'D'
  end

  def show_gesture
    case @gesture
    when 'R' then puts "#{name} choose Rock!!"
    when 'P' then puts "#{name} choose Paper!!"
    when 'S' then puts "#{name} choose Sissor!!"
    end
  end
end

# 人類玩家的類別
class Human < Player
  def get_gesture
    loop do
      puts 'Please enter the gesture [(R)ock, (P)aper, (S)issor]:'
    break if !['R', 'P', 'S'].include?(self.gesture = gets.chomp.upcase)
    end
    show_gesture
    gesture
  end
end

# 電腦的類別
class Computer < Player
  def get_gesture
    gesture = ['R', 'P', 'S'].shuffle!.last
    show_gesture
    gesture
  end
end

class RPS
  def initialize
    @number_of_round  = 0
    @human = nil
    @computer = nil

    intro
    input_user_name
    begin
        @number_of_round  += 1
        puts '\nRound #{@number_of_round} start!'
        get_player_gestures
        result = decide(@human.get_gesture, @computer.get_gesture)
        show_message(result)
    end while continue?
  end
  def intro
    #印出開場畫面，告訴玩家遊戲規則
    puts '===== Rock, Paper, Sissor!! ===='
    puts 'This is a simple game that you can play with computer.'
    puts 'You can enter "R", "P", "S" to guess with computer'
    puts '================================'
  end

  def  input_user_name
    puts 'Welcome! Please enter your name: '
    @user_name = gets.chomp
    if ""==@user_name  
        @user_name= "Player"
    end
    puts "Hi #{@user_name}. Let's start game!"
  end

  def decide(ply, ai)
    #邏輯判斷式
    result = -1  #default -1: lose
    if ply == ai 
        return result = 0 # tie case
    end
    if (ply=="R" && ai == "S") ||  (ply=="S" && ai == "P") || (ply=="P" && ai == "R")  # win case
        return result = 1
    end
  end

  def get_player_gestures
    #取得玩家和電腦兩個物件的
    @human = Human.new(@user_name)
    @computer = Computer.new("Computer")
  end

  def continue?
    #判斷玩家是否要繼續下一輪
    puts 'Do you want to continue? [Y/n] (default Y)'
    !["N"].include?(gets.chomp.upcase)
  end

  def show_message(choice)
    result =  "The final result is .........."
    #印出結果
    if 1== choice
        result += 'You win!'
    elsif 0 == choice
        result +=  'Tie Game.'
    else
        result +=  'You lose!'
    end
    puts result
  end

end

# ------------Main Program Starts Here ---------------------
# 主程式只要一行即可
game = RPS.new