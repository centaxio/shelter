require 'test_helper'

class Api::RepositoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get tags" do
    get api_repositories_tags_url
    assert_response :success
  end

  test "should get manifests" do
    get api_repositories_manifests_url
    assert_response :success
  end

  test "should get top" do
    get api_repositories_top_url
    assert_response :success
  end

  test "should get destroy" do
    get api_repositories_destroy_url
    assert_response :success
  end

  test "should get index" do
    get api_repositories_index_url
    assert_response :success
  end

end
