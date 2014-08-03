class SupportTicket < ActiveRecord::Base
  attr_accessible :full_name, :email, :reason, :other_reason, :message, :stickied, :archive
  validates :full_name, presence: true
  validates :email, presence: true
  validates :reason, presence: true
  validates :message, presence: true, length: {minimum: 10, maximum: 1500, if: lambda{self.message.present?}}
  validates :other_reason, presence: true, if: lambda{self.reason == "other"}
end
