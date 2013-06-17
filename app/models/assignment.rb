class Assignment < ActiveRecord::Base
  belongs_to :asset
  belongs_to :employee

  before_update :stop_update
  before_destroy :stop_update

  private
  def stop_update
    raise ActiveRecord::ReadOnlyRecord
  end
end
