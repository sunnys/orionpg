require 'test_helper'

class ThirdPartyEmployeesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @third_party_employee = third_party_employees(:one)
  end

  test "should get index" do
    get third_party_employees_url, as: :json
    assert_response :success
  end

  test "should create third_party_employee" do
    assert_difference('ThirdPartyEmployee.count') do
      post third_party_employees_url, params: { third_party_employee: { company_id: @third_party_employee.company_id, email: @third_party_employee.email, name: @third_party_employee.name, third_party_vendor_id: @third_party_employee.third_party_vendor_id } }, as: :json
    end

    assert_response 201
  end

  test "should show third_party_employee" do
    get third_party_employee_url(@third_party_employee), as: :json
    assert_response :success
  end

  test "should update third_party_employee" do
    patch third_party_employee_url(@third_party_employee), params: { third_party_employee: { company_id: @third_party_employee.company_id, email: @third_party_employee.email, name: @third_party_employee.name, third_party_vendor_id: @third_party_employee.third_party_vendor_id } }, as: :json
    assert_response 200
  end

  test "should destroy third_party_employee" do
    assert_difference('ThirdPartyEmployee.count', -1) do
      delete third_party_employee_url(@third_party_employee), as: :json
    end

    assert_response 204
  end
end
