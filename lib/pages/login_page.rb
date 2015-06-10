class RDLoginPage

  include PageObject

  page_url "https://www.rdstation.com.br/login"

  text_field( :user_email, :id => "user_email" )
  text_field( :user_password, :id => "user_password" )
  button( :submit, :name => "commit" )

  def login(email, passwd)
    self.user_email = email
    self.user_password = passwd
    submit
  end

end
