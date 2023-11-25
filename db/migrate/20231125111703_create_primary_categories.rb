# frozen_string_literal: true

# create primary categories
class CreatePrimaryCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :primary_categories do |t|
      t.string :name

      t.timestamps
    end
  end
end
