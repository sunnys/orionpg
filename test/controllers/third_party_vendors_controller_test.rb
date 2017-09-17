require 'test_helper'

class ThirdPartyVendorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @third_party_vendor = third_party_vendors(:one)
  end

  test "should get index" do
    get third_party_vendors_url, as: :json
    assert_response :success
  end

  test "should create third_party_vendor" do
    assert_difference('ThirdPartyVendor.count') do
      post third_party_vendors_url, params: { third_party_vendor: { address: @third_party_vendor.address, company_id: @third_party_vendor.company_id, company_id: @third_party_vendor.company_id, name: @third_party_vendor.name } }, as: :json
    end

    assert_response 201
  end

  test "should show third_party_vendor" do
    get third_party_vendor_url(@third_party_vendor), as: :json
    assert_response :success
  end

  test "should update third_party_vendor" do
    patch third_party_vendor_url(@third_party_vendor), params: { third_party_vendor: { address: @third_party_vendor.address, company_id: @third_party_vendor.company_id, company_id: @third_party_vendor.company_id, name: @third_party_vendor.name } }, as: :json
    assert_response 200
  end

  test "should destroy third_party_vendor" do
    assert_difference('ThirdPartyVendor.count', -1) do
      delete third_party_vendor_url(@third_party_vendor), as: :json
    end

    assert_response 204
  end
end
