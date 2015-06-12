class CustomSelect < PageObject::Elements::Div

  PageObject.register_widget( :custom_select, CustomSelect, 'div')

  def select_default_option
    link_element(:class => "btn btn-default").click
  end

  def select_option option
    selected_option = ul_element(:class => "dropdown-menu").find { |o| o == option }
    selected_option
  end

end
