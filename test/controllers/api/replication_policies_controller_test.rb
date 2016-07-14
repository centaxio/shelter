require 'test_helper'

class Api::ReplicationPoliciesControllerTest < ActionDispatch::IntegrationTest
  test "should get enablement" do
    get api_replication_policies_enablement_url
    assert_response :success
  end

  test "should get index" do
    get api_replication_policies_index_url
    assert_response :success
  end

  test "should get create" do
    get api_replication_policies_create_url
    assert_response :success
  end

  test "should get show" do
    get api_replication_policies_show_url
    assert_response :success
  end

  test "should get update" do
    get api_replication_policies_update_url
    assert_response :success
  end

end
