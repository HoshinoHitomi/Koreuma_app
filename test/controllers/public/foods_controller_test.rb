require 'test_helper'

class Public::FoodsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_foods_index_url
    assert_response :success
  end

  test "should get show" do
    get public_foods_show_url
    assert_response :success
  end

end
