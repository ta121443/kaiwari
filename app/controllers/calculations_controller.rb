class CalculationsController < ApplicationController
  def select
  end

  def total
    @histories = History.where('session_id = ?', params[:session_id])
    @total = calculate_total(@histories)
    @users = User.where('session_id = ?', params[:session_id])
    # @user_num = User.where('session_id = ?', params[:session_id]).count
    @user_num = 3
    @payment = {}
    graph = [ [0, 1000, 2000], [0, 0, 5000], [0, 0, 0] ]
    minCashFlow(graph)
  end

  private

    def minOf2(x, y)
      return x < y ? x : y
    end

    def minCashFlow(graph)
      amount = Array.new(@user_num, 0)
      for p in 0...@user_num
        for i in 0...@user_num
          amount[p] += (graph[i][p] - graph[p][i])
        end
      end

      minCashFlowRec(amount)
    end

    def minCashFlowRec(amount)
      mx_credit = amount.index(amount.max)
      mx_debit = amount.index(amount.min)

      if amount[mx_credit] == 0 && amount[mx_debit] == 0
        @payment = @payment.sort
        return 0
      end

      min = minOf2(-amount[mx_debit], amount[mx_credit])
      amount[mx_credit] -= min
      amount[mx_debit] += min

      @payment[mx_debit] = [mx_credit, min]

      minCashFlowRec(amount)
    end
end
