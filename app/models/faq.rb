class Faq < ActiveRecord::Base
  attr_accessible :question, :answer, :position, :archive
  default_scope order('faqs.archived_at DESC, faqs.position ASC')

  validates_presence_of :question, :answer

  scope :unarchived, lambda{where('archived_at IS NULL')}

  def archive=(boolean)
    if boolean == "true"
      self.archive!
    else
      self.unarchive!
    end
  end

  def archive!
    self.update_attribute(:archived_at, DateTime.now)
  end

  def unarchive!
    self.update_attribute(:archived_at, nil)
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
