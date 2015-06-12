class LeadSegmentationCreationPage

  include PageObject

  page_url "https://www.rdstation.com.br/segmentacao-de-leads"

  # refers to the create segmentation button
  h2( :list_name, :xpath => '//*[@id="page-header"]/h2' )
  text_field( :list_name, :id => "dynamic_list_list_name" )

end
