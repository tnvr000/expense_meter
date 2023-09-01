# frozen_string_literal: true

# expenses controller
class ExpensesController < ApplicationController
  before_action :authenticate_user!

  # GET /expenses
  # before_action - authenticate_user!
  def index
    @expenses = current_user.expenses
  end

  def new
    @expense = current_user.expenses.build
  end

  def create
    @expense = current_user.expenses.build(param_resource)
    if @expense.save
      redirect_to(expense_path(@expense))
    else
      render(:new)
    end
  end

  def show
    @expense = current_user.expenses.find_by(id: params[:id])

    redirect_to(expense_path) and return if @expense.blank?
  end

  private

  def param_resource
    params.require(:expense).permit(:description, :amount, :date_created_on, :time_created_on)
  end
end
