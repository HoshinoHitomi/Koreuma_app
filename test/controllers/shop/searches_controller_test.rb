require 'test_helper'

class Shop::SearchesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get shop_searches_index_url
    assert_response :success
  end

end
