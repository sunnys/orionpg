require 'test_helper'

class TransactionDetailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @transaction_detail = transaction_details(:one)
  end

  test "should get index" do
    get transaction_details_url, as: :json
    assert_response :success
  end

  test "should create transaction_detail" do
    assert_difference('TransactionDetail.count') do
      post transaction_details_url, params: { transaction_detail: { amount: @transaction_detail.amount, confirmed: @transaction_detail.confirmed, destination: @transaction_detail.destination, source: @transaction_detail.source, transaction_id: @transaction_detail.transaction_id, transaction_id: @transaction_detail.transaction_id, type: @transaction_detail.type } }, as: :json
    end

    assert_response 201
  end

  test "should show transaction_detail" do
    get transaction_detail_url(@transaction_detail), as: :json
    assert_response :success
  end

  test "should update transaction_detail" do
    patch transaction_detail_url(@transaction_detail), params: { transaction_detail: { amount: @transaction_detail.amount, confirmed: @transaction_detail.confirmed, destination: @transaction_detail.destination, source: @transaction_detail.source, transaction_id: @transaction_detail.transaction_id, transaction_id: @transaction_detail.transaction_id, type: @transaction_detail.type } }, as: :json
    assert_response 200
  end

  test "should destroy transaction_detail" do
    assert_difference('TransactionDetail.count', -1) do
      delete transaction_detail_url(@transaction_detail), as: :json
    end

    assert_response 204
  end
end
