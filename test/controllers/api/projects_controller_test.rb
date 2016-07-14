require 'test_helper'

class Api::ProjectsControllerTest < ActionDispatch::IntegrationTest
  test "should get publicity" do
    get api_projects_publicity_url
    assert_response :success
  end

  test "should get filter" do
    get api_projects_filter_url
    assert_response :success
  end

  test "should get index" do
    get api_projects_index_url
    assert_response :success
  end

  test "should get create" do
    get api_projects_create_url
    assert_response :success
  end

end
