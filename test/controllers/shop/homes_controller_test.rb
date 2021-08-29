require 'test_helper'

class Shop::HomesControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get shop_homes_top_url
    assert_response :success
  end

end
