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
    duration = warranty.duration_in_days - ((Time.now - warranty_start) / 86400).round
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


  class <<self
    def with_warranty_less_than_3_months
      case DATABASE_ADAPTER
        when 'sqlite3'
          Asset.find_by_sql <<-SQL
          Select a.*
          From ASSETS a, WARRANTIES b
          where
            a.warranty_id = b.id
            AND
            (b.duration_in_days - (julianday() - julianday(a.warranty_start))) < 90
          SQL
        when /mysql/
          Asset.find_by_sql <<-SQL
          Select a.*
          From ASSETS a, WARRANTIES b
          where
            a.warranty_id = b.id
            AND
            (b.duration_in_days - DATEDIFF(NOW(), a.warranty_start)) < 90
          SQL
        else
          []
      end
    end

    def unassigned asset_type_id=nil
      if asset_type_id.present?
        Asset.find_by_sql [unassigned_assets_for_type_query, asset_type_id]
      else
        Asset.find_by_sql unassigned_assets_query
      end
    end

    def unassigned_count asset_type_id=nil
      if asset_type_id.present?
        ActiveRecord::Base.connection.execute(ActiveRecord::Base.send(:sanitize_sql_array,["SELECT COUNT(id) FROM (#{unassigned_assets_for_type_query})", asset_type_id])).first[0]
      else
        ActiveRecord::Base.connection.execute("SELECT COUNT(id) FROM (#{unassigned_assets_query})").first[0]
      end
    end

    private
    def unassigned_assets_query
      <<-SQL
        SELECT a.*
        FROM ASSETS a, (
          SELECT asset_id
          From (
            SELECT DISTINCT(asset_id), type
            FROM assignments
            GROUP BY asset_id
            ORDER BY assignment_date
          )
          WHERE type = 'Unassigned'
        ) b
        WHERE a.id = b.asset_id
      SQL
    end

    def unassigned_assets_for_type_query
      <<-SQL
        SELECT a.*
        FROM ASSETS a, (
          SELECT asset_id
          From (
            SELECT DISTINCT(asset_id), type
            FROM assignments
            GROUP BY asset_id
            ORDER BY assignment_date
          )
          WHERE type = 'Unassigned'
        ) b
        WHERE
          a.id = b.asset_id
          AND
          a.asset_type_id = ?
      SQL
    end
  end
end
