{
  "Laptop" => {
    "Initial" => {
      "General" => [
        {
          :name => "Company",
          :input_element_type => :text,
          :required => true,
          :value_fill_expression => "",
          :default_value => ""        
        }, 
        {
          :name => "Model",
          :input_element_type => :text,
          :required => true,
          :value_fill_expression => "",
          :default_value => ""        
        }, 
        {
          :name => "Warranty",
          :input_element_type => :text,
          :required => true,
          :value_fill_expression => "",
          :default_value => ""        
        }, 
        {
          :name => "Warranty Start",
          :input_element_type => :date,
          :required => true,
          :value_fill_expression => "",
          :default_value => ""        
        }, 
        {
          :name => "Warranty End",
          :input_element_type => :date,
          :required => true,
          :value_fill_expression => "",
          :default_value => ""        
        }
      ],
      "Second" => [
        {
          :name => "Model",
          :input_element_type => :text,
          :required => true,
          :value_fill_expression => "",
          :default_value => ""
        },
        {
          :name => "Warranty",
          :input_element_type => :text,
          :required => true,
          :value_fill_expression => "",
          :default_value => ""
        },
      ]
    }
  },
  "Keyboard" => {
    
  },
  "Mouse" => {
    
  },
  "Monitor" => {
    
  }
}.each do |k,v|
  asset_type = AssetType.where(name: k).first_or_create
  v.each do |k1,v1|
    form = asset_type.forms.where(name: k1).first_or_create
    v1.each do |k2,v2|
      attr_group = form.form_attributes_groups.where(name: k2).first_or_create
      v2.each do |v3|
        attrs = attr_group.form_attributes.where(name:  v3[:name]).first_or_create
        attrs.update_attributes! v3
      end
    end
  end
end

['Apple', 'Dell'].each do |company|
  Company.where(name: company).first_or_create
end