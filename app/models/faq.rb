class Faq < ActiveRecord::Base
  attr_accessible :question, :answer, :position
  default_scope order('faqs.archived_at DESC, faqs.position ASC')

  validates_presence_of :question, :answer
  validate :is_a_question

  scope :unarchived, lambda{where('archived_at IS NULL')}

  def is_a_question
    if self.question.present?
      errors.add(:question, "must end in a question mark") unless self.question.last == "?"
    end
  end

  def archived?
    self.archived_at.present?
  end

  def self.by_user(user)
    if user.present? && user.exec?
      self.all
    else
      self.unarchived
    end
  end
end
