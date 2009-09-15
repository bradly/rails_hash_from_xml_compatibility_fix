require 'test_helper'

class RailsHashFromXmlCompatibilityFixTest < ActiveSupport::TestCase
  
  test "hash keys should be lowercase" do
    xml = "<Node>value</Node>"
    assert Hash.from_xml(xml).keys.first == 'node'
  end
end
