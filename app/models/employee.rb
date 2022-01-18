class Employee < ApplicationRecord
  belongs_to :user

  validates_presence_of :employee_name, :employee_number, :employee_email, :job_title, :mobile_number, :date_of_joining, :employee_salary
  validates :employee_name, length: { minimum: 2 }
  VALID_EMAIL_REGEX= /\A[a-z0-9\+\-_\.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :employee_email, uniqueness: true, on: :create
  validates :employee_email, format:{with:VALID_EMAIL_REGEX,multiline:true}
  validates :mobile_number, length: { is: 10 }

  include PgSearch::Model
  pg_search_scope :search, against: :employee_name, using: {tsearch: {prefix: true}}
  
end
