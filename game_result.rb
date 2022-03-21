# frozen_string_literal: true

module GameResult
  def game_result
    if @user.total_points <= 21 && @user.total_points > @dealer.total_points
      win_result
    elsif @user.total_points <= 21 && @user.total_points == @dealer.total_points
      drawn_result
    else
      puts 'Вы проиграли!'
    end
    replay_game
  end

  def win_result
    puts 'Вы выиграли!'
    @user.bank += @bank
    puts "Ваш банк: #{@user.bank}"
  end

  def drawn_result
    puts 'Ничья!'
    @user.bank += @bank.to_f / 2
    puts "Ваш банк: #{@user.bank}"
  end
end
