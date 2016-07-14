require 'test_helper'

class Api::MembersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_members_index_url
    assert_response :success
  end

  test "should get create" do
    get api_members_create_url
    assert_response :success
  end

  test "should get update" do
    get api_members_update_url
    assert_response :success
  end

  test "should get destroy" do
    get api_members_destroy_url
    assert_response :success
  end

end
