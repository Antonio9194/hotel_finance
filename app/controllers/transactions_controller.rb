class TransactionsController < ApplicationController
  def index
    @transactions = Transaction.all
    @monthly_transactions = Transaction.where(date: Date.current.beginning_of_month..Date.current.end_of_month)
                                       .order(date: :asc)
    @income = @monthly_transactions.income.sum(:amount)
    @expense = @monthly_transactions.expense.sum(:amount)
    @profit = @income - @expense
    @categories_expenses = @monthly_transactions.expense.group(:category).sum(:amount)
  end

  def show
    @transaction = Transaction.find(params[:id])
  end

  def new
    @transaction = Transaction.new
  end

  def create
    @transaction = Transaction.new(transaction_params)
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
    @transaction = Transaction.find(params[:id])
    @transaction.destroy
    redirect_to root_path
  end

  private

  def transaction_params
    params.require(:transaction).permit(:amount, :transaction_type, :category, :description, :date)
  end
end
