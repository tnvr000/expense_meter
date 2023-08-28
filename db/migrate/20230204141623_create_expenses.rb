# frozen_string_literal: true

# create expenses
class CreateExpenses < ActiveRecord::Migration[7.0]
  def change
    create_table :expenses do |t|
      t.references :user, null: false
      t.string :description
      t.date :date_create_on
      t.time :time_create_on
      t.float :amount

      t.timestamps
    end
  end
end
