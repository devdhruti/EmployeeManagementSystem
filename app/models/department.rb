class Department < ApplicationRecord
  belongs_to :user
  has_many :employees, dependent: :destroy

  validates_presence_of :department_name

  include PgSearch::Model
  pg_search_scope :search, against: :department_name, using: {tsearch: {prefix: true}}
  pg_search_scope :search_emp, against: :department_name
end
