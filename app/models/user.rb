class User < ApplicationRecord
  has_secure_password

  validates_presence_of :email
  validates_uniqueness_of :email
  validates_format_of :email, with: /.+@.+/, if: Proc.new { |u| u.email.present? }

  validates :password, length: {minimum: 6, maximum: 8}, on: [:create], if: :password
  validates_presence_of :password_confirmation, on: [:create]


end
