class TransactionsController < ApplicationController
  def index
    @transactions = Transaction.all
  end

  def show
    @transaction = Transaction.find(params[:id])
  end

  def new
    @transaction = Transaction.new
  end

  def create
    @transaction.new(transaction_params)
    if @transaction.save
      redirect_to root_path
    else
      flash[:alert] = "Transaction not added, something went wrong..."
      redirect_to root_path
    end
  end

  def update
  end

  def destroy
  end

  private

  def transaction_params
    params.require(:transaction).permit(:amount, :transaction_type, :category, :description, :date)
  end
end
