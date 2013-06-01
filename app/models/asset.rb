class Asset < ActiveRecord::Base
  belongs_to :asset_type
  has_many :asset_attributes_groups

  validates_presence_of :name
  validates_presence_of :serial

  accepts_nested_attributes_for :asset_attributes_groups,
                                :allow_destroy => true

  def self.build_from_form form
    asset = Asset.new
    form.form_attributes_groups.each do |group|
      g = asset.asset_attributes_groups.new name: group.name, form_attributes_group: group
      group.form_attributes.each do |attr|
        g.asset_attributes.new name: attr.name, form_attribute: attr
      end
    end
    asset
  end
end
