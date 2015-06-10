$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), "..", "lib"))
# Configuration for watir-rspec
require "watir/rspec"
require "page-object"
require "data_magic"
require "require_all"

require_all "lib"

RSpec.configure do |config|

  # Include page factory to deal with page objects
  config.include PageObject::PageFactory

  # Use Watir::RSpec::HtmlFormatter to get links to the screenshots, html and
  # all other files created during the failing examples.
  config.add_formatter(:progress) if config.formatters.empty?
  config.add_formatter(Watir::RSpec::HtmlFormatter)

  # Include RSpec::Matchers into each of your example group for making it possible to
  # use #within with some of RSpec matchers for easier asynchronous testing:
  #   expect(@browser.text_field(name: "first_name")).to exist.within(2)
  #   expect(@browser.text_field(name: "first_name")).to be_present.within(2)
  #   expect(@browser.text_field(name: "first_name")).to be_visible.within(2)
  #
  # You can also use #during to test if something stays the same during the specified period:
  #   expect(@browser.text_field(name: "first_name")).to exist.during(2)
  config.include Watir::RSpec::Matchers

  # Include RSpec::Helper into each of your example group for making it possible to
  # write in your examples instead of:
  #   @browser.goto "localhost"
  #   @browser.text_field(name: "first_name").set "Bob"
  #
  # like this:
  #   goto "localhost"
  #   text_field(name: "first_name").set "Bob"
  #
  # This needs that you've used @browser as an instance variable name in
  # before :all block.
  config.include Watir::RSpec::Helper

  # Open up the browser for each example.
  config.before :all do
    @browser = Watir::Browser.new
    visit RDLoginPage
    on(RDLoginPage).login("gustavo7lagoas@gmail.com", "rdteste")
  end

  # Close that browser after each example.
  config.after :all do
    @browser.close if @browser
  end

end