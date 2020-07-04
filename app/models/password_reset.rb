class PasswordReset
  include ActiveModel::Model
  attr_accessor :old_password, :new_password, :password_confirmation,:user

  validates :old_password, presence: true
  validates :new_password, length: {minimum: 6, maximum: 8}, if: :new_password
  validates :password_confirmation, length: {minimum: 6, maximum: 8}, if: :password_confirmation
  validate :password_match, if: Proc.new { |s| s.old_password.present? }


  def password_match
    if user and not user.authenticate old_password
      errors.add :old_password, :mismatch
    else
      do_reset
    end
  end

  def do_reset
    unless user.update(password: new_password, password_confirmation: password_confirmation)
      errors.merge! user.errors
    end
  end
end