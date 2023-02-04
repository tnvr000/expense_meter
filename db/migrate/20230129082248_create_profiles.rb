# frozen_string_literal: true

# create profile
class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.references :user, null: false, foreign_key: { on_delete: :cascade }
      t.string :first_name
      t.string :last_name
      t.date :date_of_birth
      t.integer :gender

      t.timestamps
    end
  end
end
