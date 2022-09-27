require "test_helper"

class LeaveControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get leave_index_url
    assert_response :success
  end

  test "should get new" do
    get leave_new_url
    assert_response :success
  end

  test "should get create" do
    get leave_create_url
    assert_response :success
  end
end
