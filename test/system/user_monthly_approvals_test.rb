require "application_system_test_case"

class UserMonthlyApprovalsTest < ApplicationSystemTestCase
  setup do
    @user_monthly_approval = user_monthly_approvals(:one)
  end

  test "visiting the index" do
    visit user_monthly_approvals_url
    assert_selector "h1", text: "User Monthly Approvals"
  end

  test "creating a User monthly approval" do
    visit user_monthly_approvals_url
    click_on "New User Monthly Approval"

    fill_in "Created", with: @user_monthly_approval.created
    fill_in "Status", with: @user_monthly_approval.status
    click_on "Create User monthly approval"

    assert_text "User monthly approval was successfully created"
    click_on "Back"
  end

  test "updating a User monthly approval" do
    visit user_monthly_approvals_url
    click_on "Edit", match: :first

    fill_in "Created", with: @user_monthly_approval.created
    fill_in "Status", with: @user_monthly_approval.status
    click_on "Update User monthly approval"

    assert_text "User monthly approval was successfully updated"
    click_on "Back"
  end

  test "destroying a User monthly approval" do
    visit user_monthly_approvals_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "User monthly approval was successfully destroyed"
  end
end
