require "test_helper"

class UsersLoginTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:michael)
  end

  test "login with invalid information" do
    get login_path
    assert_template 'sessions/new'
    post login_path, params: { session: { loginID: "", password: "" } }
    assert_response :unprocessable_entity
    assert_template 'sessions/new'
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end

  test "login with valid loginID/invalid password" do
    get login_path
    assert_template 'sessions/new'
    post login_path, params: { session: { loginID: @user.loginID, password: "invalid" } }
    # Add logic here to confirm that the login was unsuccessful
    assert_template 'sessions/new'
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end

  test "login with valid information followed by logout" do
    post login_path, params: { session: { loginID: @user.loginID, password: 'password' } }
    # Add logic here to confirm that the login was successful
    assert_redirected_to root_path
    follow_redirect!
    assert_template 'home/index'
    assert_select "a[href=?]", login_path, count: 0
    assert_select "a[href=?]", logout_path
    # Add tests for logout
    delete logout_path
    # Add logic here to confirm that the logout was successful
    assert_redirected_to root_path
    follow_redirect!
    assert_select "a[href=?]", login_path
    assert_select "a[href=?]", logout_path, count: 0
  end
end

