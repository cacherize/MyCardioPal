class User < ActiveRecord::Base
  attr_accessible :first, :last, :email, :username, :password, :password_confirmation, :gender, :private
  has_secure_password

  validates :first, presence: {message: 'Name is required'}
  validates :last, presence: {message: 'Name is required'}
  validates :gender, presence: {message: 'is required'}
  validates :password, presence: {message: 'is required'}, on: :create
  validates :email, presence: {message: 'is required'},
    uniqueness: {case_sensitive: false},
    format: {
      with: /^[-0-9a-z.+_]+@[-0-9a-z.+_]+\.[a-z]{2,4}$/i,
      if: lambda{self.username.present?}
    },
    on: :create
  validates :username, presence: {message: 'is required'},
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
  before_create { generate_token(:auth_token) }

  def generate_token(column)
    begin
      self[column]= SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end

  def downcase_email
    self.email.downcase! if self.email.present?
  end

  def self.find_by_email_or_username(arg)
    if arg.match(/^[-0-9a-z.+_]+@[-0-9a-z.+_]+\.[a-z]{2,4}$/i)
      find_by_email(arg.downcase)
    else
      find(:first, :conditions => ["lower(username) = ?", arg.downcase])
    end
  end

  #***** Mailer Methods *****#

  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    Messager.reset_password(self).deliver
  end
end
