require 'test_helper'

class Shop::FoodsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get shop_foods_index_url
    assert_response :success
  end

  test "should get new" do
    get shop_foods_new_url
    assert_response :success
  end

  test "should get show" do
    get shop_foods_show_url
    assert_response :success
  end

  test "should get edit" do
    get shop_foods_edit_url
    assert_response :success
  end

end
