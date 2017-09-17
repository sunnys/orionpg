require 'test_helper'

class AccountsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @account = accounts(:one)
  end

  test "should get index" do
    get accounts_url, as: :json
    assert_response :success
  end

  test "should create account" do
    assert_difference('Account.count') do
      post accounts_url, params: { account: { company_id: @account.company_id, company_id: @account.company_id, name: @account.name, paid: @account.paid, total: @account.total, unpaid: @account.unpaid } }, as: :json
    end

    assert_response 201
  end

  test "should show account" do
    get account_url(@account), as: :json
    assert_response :success
  end

  test "should update account" do
    patch account_url(@account), params: { account: { company_id: @account.company_id, company_id: @account.company_id, name: @account.name, paid: @account.paid, total: @account.total, unpaid: @account.unpaid } }, as: :json
    assert_response 200
  end

  test "should destroy account" do
    assert_difference('Account.count', -1) do
      delete account_url(@account), as: :json
    end

    assert_response 204
  end
end
