class Model < ActiveRecord::Base
  belongs_to :company
  belongs_to :asset_type
  has_many :assets
end
