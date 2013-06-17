FactoryGirl.define do
  factory :asset do
    asset_id 'ggn/2/2'
    serial '45tyheede'
    procurement_date 1.year.ago
    warranty_start 1.year.ago
    warranty_id 4
    company_id 3
    office_id 2
    asset_type_id 1
  end
end