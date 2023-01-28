# frozen_string_literal: true

# active session
class ActiveSession < ApplicationRecord
  has_secure_token :remember_token

  belongs_to :user
end
