class LeadSegmentationCreationPage

  include PageObject

  DEFAULT_SEGMENTATION_LIST_DATA = [
    [{
      :condition_1 => "O Lead contém",
      :condition_2 => "a tag",
      :condition_3 => "pessoal"
    },
    {
      :condition_1 => "O Lead contém",
      :condition_2 => "a tag",
      :condition_3 => "outro"
    }]
  ]

  page_url "https://www.rdstation.com.br/segmentacao-de-leads/nova"

  # refers to the create segmentation button
  h2( :list_title, :xpath => '//*[@id="page-header"]/h2' )
  text_field( :list_name, :id => "dynamic_list_list_name" )

  link( :add_group, :class => "btn btn-link add-group-link add_nested_fields" )
  link( :add_condition, :class => "btn btn-link add-condition-link add_nested_fields" )

  select_list( :condition1, :class => "form-control condition1-field" )
  select_list( :condition2, :class => "form-control condition2-field" )
  text_field( :condition3, :class => "form-control condition3-field ui-autocomplete-input" )

  button( :save_dynamic_list, :id => "save-dynamic-list" )

  def new_segmentation_list name
    self.list_name = name
    DEFAULT_SEGMENTATION_LIST_DATA.each_with_index { | condition_group, index |
      if (index == 0) then
        condition_group.each_with_index { | condition, index |
          if (index == 0) then
            self.condition1 = condition[:condition_1]
            self.condition2 = condition[:condition_2]
            self.condition3 = condition[:condition_3]
          else
            self.add_condition
            select_list_element(:class => "form-control condition1-field", :index => index).select(condition[:condition_1])
            select_list_element(:class => "form-control condition2-field", :index => index+1).select(condition[:condition_2])
            text_field_element(:class => "form-control condition3-field", :index => index).set(condition[:condition_3])
          end
        }
      else
        self.add_group
        condition_group.each_with_index { | condition, index |
          if (index == 0) then
            self.condition1 = condition[:condition_1]
            self.condition2 = condition[:condition_2]
            self.condition3 = condition[:condition_3]
          else
            self.add_condition
            self.condition1 = condition[:condition_1]
            self.condition2 = condition[:condition_2]
            self.condition3 = condition[:condition_3]
          end
        }
      end
    }
    save_dynamic_list
  end
end
