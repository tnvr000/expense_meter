# frozen_string_literal: true

# expenses controller
class ExpensesController < ApplicationController
  before_action :authenticate_user!

  # GET /expenses
  # before_action - authenticate_user!
  def index
    @expenses = current_user.expenses
  end
end
