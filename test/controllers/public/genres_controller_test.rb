require "test_helper"

class Public::GenresControllerTest < ActionDispatch::IntegrationTest
  test "should get shhow" do
    get public_genres_shhow_url
    assert_response :success
  end
end
