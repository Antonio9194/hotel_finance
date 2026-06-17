class TransactionsController < ApplicationController
  before_action :set_transaction, only: [:show, :edit, :update, :destroy]

  def index
    @transactions = Transaction.all
    @monthly_transactions = Transaction.where(date: Date.current.beginning_of_month..Date.current.end_of_month)
                                       .order(date: :asc)
    @income = @monthly_transactions.income.sum(:amount)
    @expense = @monthly_transactions.expense.sum(:amount)
    @profit = @income - @expense
    @categories_expenses = Transaction
      .where(date: Date.current.beginning_of_month..Date.current.end_of_month)
      .expense
      .group(:category)
      .sum(:amount)
  end

  def show
  end

  def new
    @transaction = Transaction.new
  end

  def create
    @transaction = Transaction.new(transaction_params)
    if @transaction.save
      redirect_to root_path
    else
      flash[:alert] = "Transaction not added, something went wrong"
      redirect_to root_path
    end
  end

  def edit
  end

  def update
    if @transaction.update(transaction_params)
      flash[:notice] = "Transaction updated successfully"
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @transaction.destroy
    flash[:notice] = "Transaction deleted successfully"
    redirect_to root_path
  end

  private

  def set_transaction
    @transaction = Transaction.find(params[:id])
  end

  def transaction_params
    params.require(:transaction).permit(:amount, :transaction_type, :category, :description, :date)
  end
end
