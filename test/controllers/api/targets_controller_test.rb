require 'test_helper'

class Api::TargetsControllerTest < ActionDispatch::IntegrationTest
  test "should get policies" do
    get api_targets_policies_url
    assert_response :success
  end

  test "should get ping" do
    get api_targets_ping_url
    assert_response :success
  end

  test "should get destroy" do
    get api_targets_destroy_url
    assert_response :success
  end

  test "should get index" do
    get api_targets_index_url
    assert_response :success
  end

  test "should get create" do
    get api_targets_create_url
    assert_response :success
  end

  test "should get show" do
    get api_targets_show_url
    assert_response :success
  end

  test "should get update" do
    get api_targets_update_url
    assert_response :success
  end

end
