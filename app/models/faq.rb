class Faq < ActiveRecord::Base
  attr_accessible :question, :answer, :position
  default_scope order('faqs.archived_at DESC, faqs.position ASC')
end
