class LeadSegmentationPage

  include PageObject

  page_url "https://www.rdstation.com.br/segmentacao-de-leads"

  # refers to the create segmentation button
  link( :create_segmentation, :css => "btn.btn-primary.page-action" )

  # maps URLS, in this case there is only production but we can have others
  URLS = { :production => "https://www.rdstation.com.br/segmentacao-de-leads" }

end
