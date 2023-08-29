# frozen_string_literal: true

# create expenses
class CreateExpenses < ActiveRecord::Migration[7.0]
  def change
    create_table :expenses do |t|
      t.references :user, null: false
      t.string :description
      t.date :date_created_on
      t.time :time_created_on
      t.float :amount

      t.timestamps
    end
  end
end
