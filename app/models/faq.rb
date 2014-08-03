class Faq < ActiveRecord::Base
  attr_accessible :question, :answer, :position
  default_scope order('faqs.position')
end
