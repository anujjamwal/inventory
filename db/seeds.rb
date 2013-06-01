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
  asset_type = AssetType.find_or_create_by_name(k)
  v.each do |k1,v1|
    form = asset_type.forms.find_or_create_by_name(k1)
    v1.each do |k2,v2|
      attr_group = form.form_attributes_groups.find_or_create_by_name(k2)
      v2.each do |v3|
        attr_group.form_attributes.create v3
      end
    end
  end
end