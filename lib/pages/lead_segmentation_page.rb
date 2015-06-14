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
  div( :alert_success, :class => "alert-success" )

  # Apagar Leads modal components
  text_field( :delete_leads, :class => "form-control js-destroy-leads-validation-input" )
  link( :confirm_delete, :text => "Apagar Leads" )
  h4( :delete_leads_modal_title, :id => "destroyLeadsModalLabel" )

  # Exportar Conversões modal components
  text_field( :email, :id => "email" )
  radio_button( :excel, :id => "excel_true" )
  radio_button( :csv, :id => "excel_false" )
  button( :export, :text => "Exportar" )

  def search_for term
    self.search_box = term
  end

  def select_item_option option
    self.dropdown_toogle
    self.segmentation_list_options_element.link_element( :text => option ).click
  end

  def export_conversions_modal
    the_export_conversions_modal_element
  end

  def fill_export_conversions_modal email, file_type
    self.email = email
    if file_type == "excel" then
      self.select_excel
    elsif file_type == "csv" then
      self.select_csv
    end
    self.export
  end

  def success_alert
    self.alert_success
  end

end
