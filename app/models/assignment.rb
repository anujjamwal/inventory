class Assignment < ActiveRecord::Base
  belongs_to :asset
  belongs_to :employee

  before_create :add_assignment_date
  before_update :stop_update
  before_destroy :stop_update

  private
  def stop_update
    raise ActiveRecord::ReadOnlyRecord
  end

  def add_assignment_date
    self.assignment_date ||= Time.now
  end
end
