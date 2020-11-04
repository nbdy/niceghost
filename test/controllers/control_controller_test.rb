require 'test_helper'

class ControlControllerTest < ActionDispatch::IntegrationTest
  test "should get start" do
    get control_start_url
    assert_response :success
  end

  test "should get stop" do
    get control_stop_url
    assert_response :success
  end

  test "should get restart" do
    get control_restart_url
    assert_response :success
  end

  test "should get configure" do
    get control_configure_url
    assert_response :success
  end

end
