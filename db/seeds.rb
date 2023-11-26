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

categories = {
  'Income' => [
    'Paycheck',
    'Salary',
    'Sale',
    'Rental',
    'Lottery',
    'Loan',
    'Interest',
    'Profit',
    'Gift',
    'Dues',
    'Pridictable Bonus'
  ],
  'Housing' => [
    'Mortgage',
    'Rent',
    'Renter Insurance',
    'Property Tax',
    'Repairs',
    'HOA Fees',
    'Large Appliances',
    'Maintenance'
  ],
  'Transportation' => [
    'Maintenance',
    'Rentals',
    'Oil Change',
    'Parking Fees',
    'Repairs',
    'Registration',
    'DMV Fees',
    'Toll Payment',
    'Public Transportation',
    'Fuel'
  ],
  'Food' => [
    'Groceries',
    'Resraurants',
    'Snacks',
    'Fast Food',
    'Meal'
  ],
  'Utilities' => [
    'Electricity',
    'Water',
    'Garbage',
    'LPG',
    'Phones',
    'Cable',
    'Internet'
  ],
  'Healthcare' => [
    'Prinary Care',
    'Specialty Care',
    'Urgent Care',
    'Medication',
    'Medical Devices'
  ],
  'Insurance' => [
    'Auto Insurance',
    'Life Insurance',
    'Health Insurance',
    'Disabilities Insurance',
    'Rental Insurance',
    'Home Warrenty'
  ],
  'Household Supplies' => [
    'Toiletries',
    'Laundry Detergent',
    'Dishwasher Detergent',
    'Cleaning Supplies',
    'Tool',
    'Napkin',
    'Paper Towel',
    'Toilet Paper',
    'Small Appliances',
    'Emergency Kits'
  ],
  'Personal' => [
    'Gym Membership',
    'Cloth',
    'Shoe',
    'Haircut',
    'Cosmetics',
    'Babysitter',
    'accessories',
    'Jwellery',
    'kids'
  ],
  'Loan' => [
    'Personal Loan',
    'Student Loan',
    'Auto Loan',
    'Credit Card'
  ],
  'Financial Expenses' => [
    'Advisary',
    'Charges',
    'Child Support',
    'Fines',
    'Loans',
    'Taxes',
    'Investments'
  ],
  'Education' => [
    'Book',
    'College Fees',
    'School Fees',
    'School Supplies',
    'Private Tuition',
    'Stationery',
    'Summer Camp',
    'Daycare'
  ],
  'Saving' => [
    'Emergency Fund',
    'Big Purchase',
    'Other Saving'
  ],
  'Gift' => [
    'Birthday',
    'Anniversary',
    'Wedding',
    'Festival',
    'Special Occasion',
    "Zak'at"
  ],
  'Entertainment' => [
    'Games',
    'Movies',
    'Concert',
    'Vacation',
    'Subscription'
  ],
  'Pets' => [
    'Grooming',
    'Pet Food',
    'Pet Accessories',
    'Veterinary Visits'
  ],
  'Miscellaneous' => [
    'Bank Fees',
    'Credit Card Fees',
    'Professional Dues',
    'State and Federal Taxes',
    'Other'
  ]
}

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

def save_record(record)
  record.save!
  puts "#{record.class.to_s.titlecase} #{record.id} Created"
end

categories.each_key do |primary_category_name|
  primary_category = PrimaryCategory.new(name: primary_category_name)
  save_record(primary_category)

  categories[primary_category_name].each do |category_name|
    category = primary_category.categories.build(name: category_name, editable: false)
    save_record(category)
  end
end

users.each do |user_params|
  user = User.new(user_params)
  save_record(user)
end

expenses.each do |expense_params|
  expense = Expense.new(expense_params)
  save_record(expense)
end
