class HistoriesController < ApplicationController
  def index
    @histories = History.where('session_id = ?', params[:session_id])
    # @total = calculate_total(@histories)
  end

  def new
    @history = History.new
    @users = User.where('session_id = ?', params[:session_id])
  end

  def create
    if History.create(history_params)
      flash[:success] = '立て替えの登録が完了しました'
      redirect_to histories_path
    else
      render 'new'
    end
  end

  def edit
  end

  def pudate
  end

  def destroy
  end

  def show
  end

  private
    # def calculate_total(histories)
    #   total = 0
    #   histories.each do |history|
    #     total += history.price
    #   end
    #   return total
    # end

    def history_params
      params.require(:history).permit(:session_id, :user_id, :price, :event)
    end

end
