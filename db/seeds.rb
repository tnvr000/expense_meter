# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

users = [
  {
    email: 'tnvr000@gmail.com',
    password: 'password',
    password_confirmation: 'password'
  }, {
    email: 'tnvr.ah.kh@gmail.com',
    password: 'password',
    password_confirmation: 'password'
  }
]

expenses = [
  {
    user_id: Random.rand(1..users.length),
    description: 'Potato',
    amount: 20
  }, {
    user_id: Random.rand(1..users.length),
    description: 'Tomato',
    amount: 80
  }, {
    user_id: Random.rand(1..users.length),
    description: 'Brinjal',
    amount: 30
  }, {
    user_id: Random.rand(1..users.length),
    description: 'onion',
    amount: 50
  }, {
    user_id: Random.rand(1..users.length),
    description: 'Spanich',
    amount: 30
  }, {
    user_id: Random.rand(1..users.length),
    description: 'feviquick',
    amount: 5
  }, {
    user_id: Random.rand(1..users.length),
    description: 'Paint',
    amount: 140
  }, {
    user_id: Random.rand(1..users.length),
    description: 'Keyboard and mouse combo',
    amount: 1469
  }, {
    user_id: Random.rand(1..users.length),
    description: 'Memory card',
    amount: 729
  }, {
    user_id: Random.rand(1..users.length),
    description: 'SSD',
    amount: 3400
  }, {
    user_id: Random.rand(1..users.length),
    description: 'Polished ruby',
    amount: 3000
  }, {
    user_id: Random.rand(1..users.length),
    description: 'Wired mouse',
    amount: 500
  }, {
    user_id: Random.rand(1..users.length),
    description: 'Bluetooth earphone',
    amount: 2200
  }, {
    user_id: Random.rand(1..users.length),
    description: 'Ticket: Mumbai to Durgapur',
    amount: 8130
  }, {
    user_id: Random.rand(1..users.length),
    description: 'Detergent',
    amount: 10
  },
]

users.each do |user|
  User.create(user)
end

expenses.each do |expense|
  Expense.create(expense)
end
