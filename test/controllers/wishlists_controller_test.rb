require "test_helper"

class WishlistsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get wishlists_create_url
    assert_response :success
  end

  test "should get destroy" do
    get wishlists_destroy_url
    assert_response :success
  end
end
