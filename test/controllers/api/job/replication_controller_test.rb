require 'test_helper'

class Api::Job::ReplicationControllerTest < ActionDispatch::IntegrationTest
  test "should get log" do
    get api_job_replication_log_url
    assert_response :success
  end

  test "should get index" do
    get api_job_replication_index_url
    assert_response :success
  end

  test "should get destroy" do
    get api_job_replication_destroy_url
    assert_response :success
  end

end
