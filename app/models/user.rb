class User < ActiveRecord::Base
  attr_accessible :first, :last, :email, :username, :password, :password_confirmation, :gender, :private
  has_secure_password

  validates :first, presence: {message: 'Name must be given'}
  validates :last, presence: {message: 'Name must be given'}
  validates :email, presence: {message: 'must be given'}, uniqueness: {case_sensitive: false}, on: :create
  validates :password, presence: {message: 'must be given'}, on: :create
  validates :username, presence: {message: 'must be given'},
    uniqueness: {case_sensitive: false}, 
    length: {minimum: 3, maximum: 30,
      too_long:  "is too long (max 30 chars)",
      too_short: "is too short (min 3 chars)",
      if: lambda{self.username.present?}
    },
    format: {
      with: /^[a-z0-9_-]*$/i,
      message: 'must only contain alphanumeric characters',
      if: lambda{self.username.present?}
    }

  after_validation { self.errors.messages.delete(:password_digest) }
  before_save :downcase_email

  def downcase_email
    self.email.downcase! if self.email.present?
  end
end
