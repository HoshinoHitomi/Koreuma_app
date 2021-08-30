require 'test_helper'

class Public::FavoriteFoodsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_favorite_foods_index_url
    assert_response :success
  end

end
