class EmployeeAssignment < Assignment
  validates :employee, presence: true

  def description
    "#{employee.name}(#{asset_id})"
  end
end