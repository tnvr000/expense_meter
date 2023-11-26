# frozen_string_literaL: true

# category model
class Category < ApplicationRecord
  belongs_to :primary_category
end
