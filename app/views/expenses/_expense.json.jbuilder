json.extract! expense, :id, :customer_id, :title, :amount, :description, :created_at, :updated_at
json.url expense_url(expense, format: :json)
