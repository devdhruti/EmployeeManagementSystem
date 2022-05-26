class Leave < ApplicationRecord
  belongs_to :employee
  validate :end_after_start
  validate :start_and_end_date
  validates_presence_of :leave_note, :notify_employee, :start_date, :end_date, :employee_id
  validates :leave_note, length: { minimum: 2 }
  VALID_EMAIL_REGEX= /\A[a-z0-9\+\-_\.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :notify_employee, format:{with:VALID_EMAIL_REGEX,multiline:true}
  before_create :confirmation_token

  def email_activate
    self.email_confirmed = true
    self.confirm_token = nil
    save!(:validate => false)
  end
  
  private
  def end_after_start
    return if end_date.blank? || start_date.blank?
  
    if end_date < start_date
      errors.add(:end_date, "end date must be after the start date") 
    end 
  end

  def start_and_end_date
    if start_date.blank?
      errors.add(:end_date, "start date must exist")
    elsif end_date.blank?
      errors.add(:end_date, "end date must exist")
    end
  end

  def confirmation_token
    if self.confirm_token.blank?
        self.confirm_token = SecureRandom.urlsafe_base64.to_s
    end
  end
end
