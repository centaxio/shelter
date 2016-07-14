require 'test_helper'

class Api::LogsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_logs_index_url
    assert_response :success
  end

end
