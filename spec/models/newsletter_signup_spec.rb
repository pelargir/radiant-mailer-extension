require File.dirname(__FILE__) + '/../spec_helper'

describe "NewsletterSignup" do
  
  it "should parse body" do
    signup = NewsletterSignup.new
    signup.parse_body %(
First Name: John
Last Name: Smith
Email: john@smith.com
Street Address: 123 Maple St
City: Raleigh
State: NC
Zip: 12345
)
    assert_equal "John", signup.first_name
    assert_equal "Smith", signup.last_name
    assert_equal "john@smith.com", signup.email
    assert_equal "123 Maple St", signup.street_address
    assert_equal "Raleigh", signup.city
    assert_equal "NC", signup.state
    assert_equal "12345", signup.zip
  end
  
end
