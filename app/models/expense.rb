# frozen_string_literal: true

# Expense
class Expense < ApplicationRecord
  belongs_to :user
end
