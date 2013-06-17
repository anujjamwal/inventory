class Employee < ActiveRecord::Base
  has_many :asset_assignments
end
