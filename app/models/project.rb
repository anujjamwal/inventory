class Project < ActiveRecord::Base
  def self.find_by_project_code code
    project = Project.find_by(project_code: code)
    if project.nil?
      tw_project = TW::Project.find_by_project_code(code)
      project = Project.where(project_code: code).first_or_create if tw_project
    end
    project
  end

  private
  def self.find_by_project_code_from_TW code
    new(project_code: code).save
  end
end
