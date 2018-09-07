require 'test_helper'

class UserMonthlyApprovalsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_monthly_approval = user_monthly_approvals(:one)
  end

  test "should get index" do
    get user_monthly_approvals_url
    assert_response :success
  end

  test "should get new" do
    get new_user_monthly_approval_url
    assert_response :success
  end

  test "should create user_monthly_approval" do
    assert_difference('UserMonthlyApproval.count') do
      post user_monthly_approvals_url, params: { user_monthly_approval: { created: @user_monthly_approval.created, status: @user_monthly_approval.status } }
    end

    assert_redirected_to user_monthly_approval_url(UserMonthlyApproval.last)
  end

  test "should show user_monthly_approval" do
    get user_monthly_approval_url(@user_monthly_approval)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_monthly_approval_url(@user_monthly_approval)
    assert_response :success
  end

  test "should update user_monthly_approval" do
    patch user_monthly_approval_url(@user_monthly_approval), params: { user_monthly_approval: { created: @user_monthly_approval.created, status: @user_monthly_approval.status } }
    assert_redirected_to user_monthly_approval_url(@user_monthly_approval)
  end

  test "should destroy user_monthly_approval" do
    assert_difference('UserMonthlyApproval.count', -1) do
      delete user_monthly_approval_url(@user_monthly_approval)
    end

    assert_redirected_to user_monthly_approvals_url
  end
end
