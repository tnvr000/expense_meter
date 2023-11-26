# frozen_string_literal: true

# primary category model
class PrimaryCategory < ApplicationRecord
  has_many :categories

  class << self
    def with_category_count
      joins(:categories)
        .group('primary_categories.id')
        .select('primary_categories.*, COUNT(*) AS category_count')
    end
  end
end
