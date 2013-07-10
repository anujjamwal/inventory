class Employee < ActiveRecord::Base
  has_many :assignments, foreign_key: :assignee_id

  validates :emp_id, uniqueness: true, presence: true

  def self.find_by_employee_id id
    find_or_create_for_identifier :emp_id, id
  end

  def self.find_by_ad_id id
    find_or_create_for_identifier :ad_id, id
  end

  def current_assigned_assets
    Asset.find_by_sql (
      <<-SQL
        SELECT *
        FROM assets b, (
          SELECT a.*
          FROM (
            SELECT DISTINCT(asset_id), type, assignee_id
            FROM assignments
            GROUP BY asset_id
            ORDER BY assignment_date
          ) a
          WHERE
            a.type = 'EmployeeAssignment'
            AND
            a.assignee_id = #{id}
          ) c
        WHERE b.id = c.asset_id
      SQL
    )
  end

  def admin?
    admin_flag
  end

  private
  def self.find_or_create_for_identifier(attr, value)
    employee = Employee.find_by attr => value
    if employee.nil?
      emp = TW::User.find value
      if emp
        employee = Employee.new( name: emp.name, emp_id: emp.id, email: emp.email, ad_id: emp.ad_id)
        employee.save!
      end
    end
    employee
  end
end
