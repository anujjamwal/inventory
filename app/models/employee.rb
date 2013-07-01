class Employee < ActiveRecord::Base
  has_many :assignments

  validates :emp_id, uniqueness: true, presence: true

  def self.find_by_employee_id id
    employee = Employee.where(emp_id: id).last
    if(employee.nil?)
      emp = ThoughtWorks::User.find id
      employee = Employee.create name: emp.name, emp_id: id, email: emp.email
    end
    employee
  end
end
