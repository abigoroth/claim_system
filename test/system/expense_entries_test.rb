require "application_system_test_case"

class ExpenseEntriesTest < ApplicationSystemTestCase
  setup do
    @expense_entry = expense_entries(:one)
  end

  test "visiting the index" do
    visit expense_entries_url
    assert_selector "h1", text: "Expense Entries"
  end

  test "creating a Expense entry" do
    visit expense_entries_url
    click_on "New Expense Entry"

    fill_in "Created", with: @expense_entry.created
    fill_in "Description", with: @expense_entry.description
    fill_in "Fixed Asset Price", with: @expense_entry.fixed_asset_price
    fill_in "Food Price", with: @expense_entry.food_price
    fill_in "Misc Price", with: @expense_entry.misc_price
    fill_in "Parking Price", with: @expense_entry.parking_price
    fill_in "Toll Price", with: @expense_entry.toll_price
    fill_in "Travel Distance", with: @expense_entry.travel_distance
    fill_in "Travel Price", with: @expense_entry.travel_price
    click_on "Create Expense entry"

    assert_text "Expense entry was successfully created"
    click_on "Back"
  end

  test "updating a Expense entry" do
    visit expense_entries_url
    click_on "Edit", match: :first

    fill_in "Created", with: @expense_entry.created
    fill_in "Description", with: @expense_entry.description
    fill_in "Fixed Asset Price", with: @expense_entry.fixed_asset_price
    fill_in "Food Price", with: @expense_entry.food_price
    fill_in "Misc Price", with: @expense_entry.misc_price
    fill_in "Parking Price", with: @expense_entry.parking_price
    fill_in "Toll Price", with: @expense_entry.toll_price
    fill_in "Travel Distance", with: @expense_entry.travel_distance
    fill_in "Travel Price", with: @expense_entry.travel_price
    click_on "Update Expense entry"

    assert_text "Expense entry was successfully updated"
    click_on "Back"
  end

  test "destroying a Expense entry" do
    visit expense_entries_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Expense entry was successfully destroyed"
  end
end
