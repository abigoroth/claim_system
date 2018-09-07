require 'test_helper'

class ExpenseEntriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @expense_entry = expense_entries(:one)
  end

  test "should get index" do
    get expense_entries_url
    assert_response :success
  end

  test "should get new" do
    get new_expense_entry_url
    assert_response :success
  end

  test "should create expense_entry" do
    assert_difference('ExpenseEntry.count') do
      post expense_entries_url, params: { expense_entry: { created: @expense_entry.created, description: @expense_entry.description, fixed_asset_price: @expense_entry.fixed_asset_price, food_price: @expense_entry.food_price, misc_price: @expense_entry.misc_price, parking_price: @expense_entry.parking_price, toll_price: @expense_entry.toll_price, travel_distance: @expense_entry.travel_distance, travel_price: @expense_entry.travel_price } }
    end

    assert_redirected_to expense_entry_url(ExpenseEntry.last)
  end

  test "should show expense_entry" do
    get expense_entry_url(@expense_entry)
    assert_response :success
  end

  test "should get edit" do
    get edit_expense_entry_url(@expense_entry)
    assert_response :success
  end

  test "should update expense_entry" do
    patch expense_entry_url(@expense_entry), params: { expense_entry: { created: @expense_entry.created, description: @expense_entry.description, fixed_asset_price: @expense_entry.fixed_asset_price, food_price: @expense_entry.food_price, misc_price: @expense_entry.misc_price, parking_price: @expense_entry.parking_price, toll_price: @expense_entry.toll_price, travel_distance: @expense_entry.travel_distance, travel_price: @expense_entry.travel_price } }
    assert_redirected_to expense_entry_url(@expense_entry)
  end

  test "should destroy expense_entry" do
    assert_difference('ExpenseEntry.count', -1) do
      delete expense_entry_url(@expense_entry)
    end

    assert_redirected_to expense_entries_url
  end
end
