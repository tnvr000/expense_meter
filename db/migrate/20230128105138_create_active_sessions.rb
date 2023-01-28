class CreateActiveSessions < ActiveRecord::Migration[7.0]
  def change
    create_table :active_sessions do |t|
      t.references :user, null: false, foreign_key: { on_delete: :cascade }
      t.string :user_agent
      t.string :ip_address

      t.timestamps
    end
  end
end
