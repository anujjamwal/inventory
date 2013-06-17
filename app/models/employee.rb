class Employee < ActiveRecord::Base
  has_many :assignments

  validates :emp_id, uniqueness: true, presence: true
end
