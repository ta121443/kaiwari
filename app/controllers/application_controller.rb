class ApplicationController < ActionController::Base
  def calculate_total(histories)
    total = 0
    histories.each do |history|
      total += history.price
    end
    return total
  end
end
