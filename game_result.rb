# frozen_string_literal: true

module GameResult
  MAX_POINTS = 21

  def game_result
    if dealer_points > MAX_POINTS && user_points < dealer_points
      win_result
    elsif user_points <= MAX_POINTS && user_points == dealer_points
      drawn_result
    elsif user_points > MAX_POINTS && dealer_points > MAX_POINTS
      loss_result
    else
      puts 'Вы проиграли!'
    end
  end

  private

  def user_points
    @user.total_points
  end

  def dealer_points
    @dealer.total_points
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

  def loss_result
    puts 'Никто не выиграл!'
    puts "Ваш банк: #{@user.bank}"
  end
end
