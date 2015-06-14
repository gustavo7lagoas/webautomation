class DynamicList

  include PageObject

  div( :condition_fields, :class => "fields" )
  select_list( :condition2, :class => "form-control condition2-field" )
  text_field( :condition3, :class => "form-control condition3-field ui-autocomplete-input" )

  def condition_fields
    puts div_element.html
  end

end

