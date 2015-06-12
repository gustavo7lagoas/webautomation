class LeadSegmentationPage

  include PageObject

  page_url "https://www.rdstation.com.br/segmentacao-de-leads"

  # refers to the create segmentation button
  link( :create_segmentation, :class => "page-action" )
  select_list( :regiters_per_page, :name => "table-dynamiclist-index_length" )
  link( :show_leads, :text => "Mostrar Leads" )
  text_field( :search_box, :css => "input[type=search]" )
  div( :segmentation_list_totals, :class => "dataTables_info" )
  div( :segmentation_list_options, :class => "btn-group pull-right open" )
  button( :dropdown_toogle, :class => "dropdown-toggle" )

  def search_for term
    self.search_box = term
  end

  def select_item_option option
    self.dropdown_toogle
    self.segmentation_list_options_element.link_element( :text => option ).click
  end

end
