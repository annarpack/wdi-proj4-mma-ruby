class User < ApplicationRecord
  has_secure_password
  before_validation :downcase_email

  validates :email,
      presence: true,
      uniqueness: true,
      format: {
        with: /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/,
        message: "Invalid email address"
      },
      length: {
        minimum: 5,
        message: "How can an email be less than 5 characters?"
      }

  validates :password_confirmation, presence: true
  validates :password, confirmation: true
  validates :name, presence: true

  private

  def downcase_email
    self.email = email.downcase if email.present?
  end


end
