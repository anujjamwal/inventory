class FormAttribute < ActiveRecord::Base

  validates_presence_of :name
  validates_presence_of :input_element_type

  def value_fill
    ERB.new(self.value_fill_expression).result
  rescue 
    nil
  end


end
