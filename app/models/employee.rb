class Employee < ApplicationRecord

  belongs_to :user
  belongs_to :department
  has_many :leaves, dependent: :destroy

  validates_presence_of :employee_first_name, :employee_last_name, :employee_number, :employee_email, :job_title, :mobile_number, :date_of_joining, :employee_salary, :department_id
  validates :employee_first_name, length: { minimum: 2 }
  validates :employee_last_name, length: { minimum: 2 }
  VALID_EMAIL_REGEX= /\A[a-z0-9\+\-_\.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :employee_email, uniqueness: true, on: :create
  validates :employee_email, format:{with:VALID_EMAIL_REGEX,multiline:true}
  validates :mobile_number, length: { is: 10 }

  include PgSearch::Model
  pg_search_scope :search, against: [:employee_first_name, :employee_last_name], using: {tsearch: {prefix: true}}
end
