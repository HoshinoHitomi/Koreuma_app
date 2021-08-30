require 'test_helper'

class Public::InformationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_informations_index_url
    assert_response :success
  end

  test "should get show" do
    get public_informations_show_url
    assert_response :success
  end

end
