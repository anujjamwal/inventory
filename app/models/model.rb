class Model < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :company, presence: true
  validates :asset_type, presence: true

  belongs_to :company
  belongs_to :asset_type
  has_many :assets
end
