require 'test_helper'

class Api::StatisticsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_statistics_index_url
    assert_response :success
  end

end
