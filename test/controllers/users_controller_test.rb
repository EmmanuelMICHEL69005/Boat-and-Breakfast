require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get first_name" do
    get users_first_name_url
    assert_response :success
  end

  test "should get last_name" do
    get users_last_name_url
    assert_response :success
  end

  test "should get phone_number:string" do
    get users_phone_number:string_url
    assert_response :success
  end

  test "should get boat_licence:string" do
    get users_boat_licence:string_url
    assert_response :success
  end

  test "should get email:string" do
    get users_email:string_url
    assert_response :success
  end

end
