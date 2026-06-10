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
    get new_record_url
    assert_response :success
  end

  test "should get create" do
    post records_url
    assert_response :success
  end

  test "should get show" do
    get record_by_date_url(date: Date.current)
    assert_response :success
  end

  test "should get edit" do
    get edit_record_url(Record.first)
    assert_response :success
  end

  test "should get destroy" do
    delete record_url(Record.first)
    assert_response :success
  end
end
