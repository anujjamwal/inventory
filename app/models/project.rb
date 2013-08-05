class Project < ActiveRecord::Base
  validates :project_code, presence: true, uniqueness: true

  def self.find_by_project_code code
    Project.where(project_code: code).first_or_create
  end

  private
  def self.find_by_project_code_from_TW code
    new(project_code: code).save
  end
end
