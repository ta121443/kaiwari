class CalculationsController < ApplicationController
  def select
  end

  def total
    histories = History.where('session_id = ?', params[:session_id])
    @total = calculate_total(histories)

    @users = User.where('session_id = ?', params[:session_id])
    @user_num = User.where('session_id = ?', params[:session_id]).count
    graph, @remainder = make_graph(histories)
    @payment = {}
    # min_cash_flow(graph)
  end

  private

    # 二つの引数のうち小さい方を返す
    def minOf2(x, y)
      return x < y ? x : y
    end

    
    def calculate_total(histories)
      total = 0
      histories.each do | history |
        total += history.price
      end
      return total
    end

    # 誰が誰にいくら払うかを示す配列を作成
    def make_graph(histories)
      graph = Array.new(@user_num) { Array.new(@user_num, 0) }
      remainder = 0
    #   histories.each do | history |
    #   end
      return graph, remainder
    end

    def min_cash_flow(graph)
      amount = Array.new(@user_num, 0)
      for p in 0...@user_num
        for i in 0...@user_num
          amount[p] += (graph[i][p] - graph[p][i])
        end
      end

      min_cash_flow_rec(amount)
    end

    def min_cash_flow_rec(amount)
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

      min_cash_flow_rec(amount)
    end
end
