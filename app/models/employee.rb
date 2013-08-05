class Employee < ActiveRecord::Base
  has_many :assignments, foreign_key: :assignee_id

  validates :ad_id, uniqueness: true, presence: true

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
    employee = Employee.where( attr => value).first_or_create
  end
end
