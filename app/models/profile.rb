# frozen_string_literal: true

# profile
class Profile < ApplicationRecord
  belongs_to :user

  enum :gender, GENDER_MAP

  def name
    "#{first_name} #{last_name}".strip
  end
end
