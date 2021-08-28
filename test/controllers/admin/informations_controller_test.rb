require 'test_helper'

class Admin::InformationsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_informations_new_url
    assert_response :success
  end

  test "should get show" do
    get admin_informations_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_informations_edit_url
    assert_response :success
  end

end
