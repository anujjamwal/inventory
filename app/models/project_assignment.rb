class ProjectAssignment < Assignment
  validates :project, presence: true
  belongs_to :project, foreign_key: :assignee_id

  def description
    project.project_code
  end
end