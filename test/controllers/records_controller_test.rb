require "test_helper"

class RecordsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    sign_in @user
  end

  test "should get index" do
    get records_url
    assert_response :success
  end

  test "should get new" do
    skip "new not implemented"
  end

  test "should get create" do
    post records_url, params: { record: { date: Date.current, memo: "test" } }
    assert_response :redirect
  end

  test "should get show" do
    get record_by_date_url(date: Date.current)
    assert_response :success
  end

  test "should get edit" do
    skip "edit not implemented"
  end

  test "should get destroy" do
    skip "destroy not implemented"
  end
end
