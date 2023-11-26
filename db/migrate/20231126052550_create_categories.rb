# frozen_string_literal: true

# create categories table
class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.string :name
      t.references :primary_category
      t.boolean :editable, default: true

      t.timestamps
    end
  end
end
