# frozen_string_literal: true

class User < ApplicationRecord
  include RailsJwtAuth::Authenticatable

  has_one :setting, dependent: :destroy

  has_many :activities, dependent: :destroy
  has_many :employees, dependent: :destroy
  has_many :evaluations, through: :employees
  has_many :templates, dependent: :destroy

  # # Validation
  #
  validates :email, presence: true, uniqueness: true, format: URI::MailTo::EMAIL_REGEXP
  validates :password, presence: true, length: { in: 6..32 }, if: ->(u) { u.password.present? }

  validates :first_name, :last_name, presence: true

  # # Callbacks
  #
  after_create :create_setting

  # # Enums
  #
  enum role: { admin: 'admin', evaluator: 'evaluator' }
end
