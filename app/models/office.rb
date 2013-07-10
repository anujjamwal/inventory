class Office < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :country, presence: true

  belongs_to :country
end
