require "test_helper"

class EuclidControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get euclid_index_url
    assert_response :success
  end

  test "should get result" do
    get euclid_result_url
    assert_response :success
  end
end
