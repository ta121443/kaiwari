class CalculationsController < ApplicationController
  def select
  end

  def total
    histories = History.where('session_id = ?', params[:session_id])
    @total = calculate_total(histories)

    @users = User.where('session_id = ?', params[:session_id])
    @user_num = User.where('session_id = ?', params[:session_id]).count
    @graph = make_graph(histories)
    @payment = []
    min_cash_flow(@graph)
    # @user_num = 3
    graph = [ [0, 1000, 2000], [0, 0, 5000], [0, 0, 0] ]
    @after = make_after(@graph)
  end

  private

    # 二つの引数のうち小さい方を返す
    def minOf2(x, y)
      return x < y ? x : y
    end

    def make_after(graph)
      amount = Array.new(@user_num, 0)
      for p in 0...@user_num
        for i in 0...@user_num
          amount[p] += (graph[i][p] - graph[p][i])
        end
      end
      return amount
    end

    # 総額を計算
    def calculate_total(histories)
      total = 0
      histories.each do | history |
        total += history.price
      end
      return total
    end

    # 誰が誰にいくら払うかを示す配列を作成
    def make_graph(histories)
      graph = Array.new(@user_num) { Array.new(@user_num, 0) }    # 誰が誰にいくら払うか

      histories.each do | history |
        price = history.price
        paid_user = history.user_id - 1   # 支払ったメンバーのidを取得し、indexに使うため-1する

        # 割り切れない分は支払い者が得するように
        while price % @user_num != 0 do
          price += 1
        end

        per_one = price / @user_num   # 一人当たりの金額

        for i in 0...@user_num
          if i == (paid_user)
            next
          end
          graph[i][paid_user] += per_one
        end
      end

      return graph
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

      @payment.push([mx_debit, [mx_credit, min]])
      min_cash_flow_rec(amount)
    end
end
