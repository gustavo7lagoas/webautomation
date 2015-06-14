class LeadsPage

  include PageObject

  page_url "https://www.rdstation.com.br/leads"

  span( :leads_total, :class => "btn-height-sm" )

end
