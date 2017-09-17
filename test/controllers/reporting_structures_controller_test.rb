require 'test_helper'

class ReportingStructuresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @reporting_structure = reporting_structures(:one)
  end

  test "should get index" do
    get reporting_structures_url, as: :json
    assert_response :success
  end

  test "should create reporting_structure" do
    assert_difference('ReportingStructure.count') do
      post reporting_structures_url, params: { reporting_structure: { employee_id: @reporting_structure.employee_id, reportee_id: @reporting_structure.reportee_id } }, as: :json
    end

    assert_response 201
  end

  test "should show reporting_structure" do
    get reporting_structure_url(@reporting_structure), as: :json
    assert_response :success
  end

  test "should update reporting_structure" do
    patch reporting_structure_url(@reporting_structure), params: { reporting_structure: { employee_id: @reporting_structure.employee_id, reportee_id: @reporting_structure.reportee_id } }, as: :json
    assert_response 200
  end

  test "should destroy reporting_structure" do
    assert_difference('ReportingStructure.count', -1) do
      delete reporting_structure_url(@reporting_structure), as: :json
    end

    assert_response 204
  end
end
