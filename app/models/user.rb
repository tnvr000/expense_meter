# frozen_string_literal: true

# User
class User < ApplicationRecord
  has_secure_password

  has_one :profile
  has_many :active_sessions, dependent: :destroy

  before_save :downcase_email
  after_create :prepare_user

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, presence: true, uniqueness: true

  private

  def downcase_email
    self.email = email.downcase
  end

  def prepare_user
    create_profile
  end
end
