class EmployeeAssignment < Assignment
  validates :employee, presence: true
  belongs_to :employee, foreign_key: :assignee_id

  def description
    "#{employee.name}(#{asset_id})"
  end
end