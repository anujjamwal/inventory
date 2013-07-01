class Asset < ActiveRecord::Base
  belongs_to :asset_type
  has_many :asset_attributes_groups
  has_many :asset_attributes, through: :asset_attributes_groups
  has_many :assignments

  [:asset_id, :serial, :warranty_id, :company_id, :warranty_start, :procurement_date].each do |field|
    validates field, presence: true
  end

  default_scope :include => [:asset_attributes]

  accepts_nested_attributes_for :asset_attributes_groups, allow_destroy: true
  belongs_to :company
  belongs_to :warranty
  belongs_to :model
  belongs_to :form

  after_find :bind_getter_for_attributes
  after_create :init_assignment

  def self.build_from_form form
    asset = Asset.new
    form.form_attributes_groups.each do |group|
      g = asset.asset_attributes_groups.build name: group.name, form_attributes_group: group
      group.form_attributes.each do |attr|
        g.asset_attributes.build name: attr.name, form_attribute: attr
      end
    end if form.present?
    asset
  end

  def clone
    asset = Asset.new
    self.form.form_attributes_groups.each do |group|
      g = asset.asset_attributes_groups.build name: group.name, form_attributes_group: group
      group.form_attributes.each do |attr|
        g.asset_attributes.build name: attr.name, form_attribute: attr, value: self.send(attr.name.snake_case.to_sym)
      end
    end  if self.form.present?
    %w{warranty_id company_id warranty_start procurement_date}.each {|attr| asset.send("#{attr}=", self.send(attr)) }
    asset
  end

  def current_assignment
    @current_assignment ||= self.assignments.find_by_sql( <<-SQL
      Select b.*
      from (Select id, max(assignment_date)
            from ASSIGNMENTS
            where asset_id = #{self.id} ) a, assignments b
      where a.id = b.id
    SQL
    ).first
  end

  def warranty_left
    duration = warranty.duration_in_days - ((warranty_start - Time.now) / 86400).round
    duration > 0 ? duration : 0
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

  def init_assignment
    self.assignments.new(type: Unassigned.name, assignment_date: self.procurement_date).save!
  end
end
