require 'test_helper'

class MyAccountsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @my_account = my_accounts(:one)
  end

  test "should get index" do
    get my_accounts_url, as: :json
    assert_response :success
  end

  test "should create my_account" do
    assert_difference('MyAccount.count') do
      post my_accounts_url, params: { my_account: { total_earning: @my_account.total_earning } }, as: :json
    end

    assert_response 201
  end

  test "should show my_account" do
    get my_account_url(@my_account), as: :json
    assert_response :success
  end

  test "should update my_account" do
    patch my_account_url(@my_account), params: { my_account: { total_earning: @my_account.total_earning } }, as: :json
    assert_response 200
  end

  test "should destroy my_account" do
    assert_difference('MyAccount.count', -1) do
      delete my_account_url(@my_account), as: :json
    end

    assert_response 204
  end
end
