class SupportTicket < ActiveRecord::Base
  attr_accessible :fullname, :email, :reason, :message, :stickied, :archive
end
