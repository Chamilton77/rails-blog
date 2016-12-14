require 'test_helper'

class UserfriendsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get userfriends_index_url
    assert_response :success
  end

  test "should get new" do
    get userfriends_new_url
    assert_response :success
  end

  test "should get edit" do
    get userfriends_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get userfriends_destroy_url
    assert_response :success
  end

  test "should get show" do
    get userfriends_show_url
    assert_response :success
  end

  test "should get update" do
    get userfriends_update_url
    assert_response :success
  end

end
