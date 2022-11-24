class CalculationsController < ApplicationController
  def select
  end

  def total
    @histories = History.where('session_id = ?', params[:session_id])
    @total = calculate_total(@histories)
  end
end
