class Asset < ActiveRecord::Base
  belongs_to :asset_type
  has_many :asset_attributes_groups
  has_many :asset_attributes, through: :asset_attributes_groups

  default_scope :include => [:asset_attributes]

  accepts_nested_attributes_for :asset_attributes_groups,
                                :allow_destroy => true

  after_find :bind_getter_for_attributes

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

  private
  def bind_getter_for_attributes
    asset_attributes.each do |attribute|
      method_name = attribute.name.snake_case
      eval "def #{method_name}
        '#{attribute.value}'
      end"
      @attributes[method_name.to_sym] = attribute.value
      @attributes_cache[method_name] = attribute.value
      instance_variable_set "@#{method_name}".to_sym, attribute.value
    end
  end
end
