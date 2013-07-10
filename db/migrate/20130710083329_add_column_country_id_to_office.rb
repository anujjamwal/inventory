class AddColumnCountryIdToOffice < ActiveRecord::Migration
  def change
    add_column :offices, :country_id, :integer
  end
end
