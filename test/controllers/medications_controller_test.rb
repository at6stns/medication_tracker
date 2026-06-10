require "test_helper"

class MedicationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    sign_in @user
  end

  test "should get index" do
    get medications_url
    assert_response :success
  end

  test "should get new" do
    get new_medication_url
    assert_response :success
  end

  test "should get create" do
  post medications_url, params: { medication: { name: "テスト薬", use: "テスト", start_date: Date.current, dosage_ids: [] } }
  assert_response :redirect
end
end
