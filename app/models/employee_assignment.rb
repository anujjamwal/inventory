class EmployeeAssignment < Assignment
  validates :employee, presence: true
end