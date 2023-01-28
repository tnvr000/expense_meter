# frozen_string_literal: true

# User
class User < ApplicationRecord
  has_secure_password

  has_many :active_sessions, dependent: :destroy

  before_save :downcase_email

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, presence: true, uniqueness: true

  private

  def downcase_email
    self.email = email.downcase
  end
end
