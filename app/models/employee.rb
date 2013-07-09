class Employee < ActiveRecord::Base
  has_many :assignments, foreign_key: :assignee_id

  validates :emp_id, uniqueness: true, presence: true

  def self.find_by_employee_id id
    find_or_create_for_identifier :emp_id, id
  end

  def self.find_by_ad_id id
    find_or_create_for_identifier :ad_id, id
  end

  private
  def self.find_or_create_for_identifier(attr, value)
    employee = Employee.find_by attr => value
    if employee.nil?
      emp = TW::User.find value
      employee = Employee.create( name: emp.name, emp_id: emp.id, email: emp.email, ad_id: emp.ad_id) if emp
    end
    employee
  end
end
