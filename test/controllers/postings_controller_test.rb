require 'test_helper'

class PostingsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get postings_index_url
    assert_response :success
  end

  test "should get new" do
    get postings_new_url
    assert_response :success
  end

  test "should get create" do
    get postings_create_url
    assert_response :success
  end

  test "should get edit" do
    get postings_edit_url
    assert_response :success
  end

  test "should get update" do
    get postings_update_url
    assert_response :success
  end

  test "should get delete" do
    get postings_delete_url
    assert_response :success
  end

end
