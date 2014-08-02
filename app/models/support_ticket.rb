class SupportTicket < ActiveRecord::Base
  attr_accessible :full_name, :email, :reason, :other_reason, :message, :stickied, :archive
end
