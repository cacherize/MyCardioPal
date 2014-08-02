class SupportTicket < ActiveRecord::Base
  attr_accessible :fullname, :email, :reason, :other_reason, :message, :stickied, :archive
end
