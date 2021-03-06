{
    "Laptop" => {
        "Initial" => {
            "Info" => [
                {
                    :name => "RAM",
                    :input_element_type => :text,
                    :required => true,
                    :value_fill_expression => "",
                    :default_value => ""
                },
                {
                    :name => "MAC Address",
                    :input_element_type => :text,
                    :required => true,
                    :value_fill_expression => "",
                    :default_value => ""
                },
                {
                    :name => "OS",
                    :input_element_type => :text,
                    :required => true,
                    :value_fill_expression => "",
                    :default_value => ""
                },
                {
                    :name => "Processor",
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
}.each do |k, v|
  asset_type = AssetType.where(name: k).first_or_create!
  v.each do |k1, v1|
    form = asset_type.forms.where(name: k1).first_or_create!
    v1.each do |k2, v2|
      attr_group = form.form_attributes_groups.where(name: k2).first_or_create!
      v2.each do |v3|
        attrs = attr_group.form_attributes.where(v3).first_or_create!
      end
    end
  end
end

{
    'Laptop' => '/images/macbook-pro-15_250x250.jpg',
    'Keyboard' => '/images/Keyboard_250x250.png',
    'Mouse' => '/images/mouse_250x250.jpg',
    'Monitor' => '/images/monitor_250x250.jpg'
}.each do |k, v|
  asset_type = AssetType.where(name: k).first
  asset_type.image = v
  asset_type.save
end

laptop = AssetType.find_by(name: 'Laptop')
{'Apple' => [{name: 'MacBook Pro 15', asset_type_id: laptop.id}, {name: 'MacBook Air 13', asset_type_id: laptop.id},
             {name: 'MacBook Pro 15 Retina', asset_type_id: laptop.id}],
 'Dell' => [{name: 'Latitude 15', asset_type_id: laptop.id}, {name: 'Studio XPS 13', asset_type_id: laptop.id}]}.each do |company, models|
  company = Company.where(name: company).first_or_create!
  models.each do |model|
    company.models.where(model).first_or_create!
  end
end

[
    {
        name: 'Apple 1 year protection',
        duration_in_days: 365,
        company_id: Company.find_by_name('Apple')
    }
].each do |warranty|
  warrant = Warranty.where(name: warranty[:name]).first_or_create!
  warrant.update_attributes! warranty
end


{'India' => ['Gurgaon']}.each do |country, offices|
  country = Country.where(name: country).first_or_create!
  offices.each do |office|
    country.offices.where(name: office).first_or_create!
  end
end