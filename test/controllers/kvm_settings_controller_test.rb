require 'test_helper'

class KvmSettingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @kvm_setting = kvm_settings(:one)
  end

  test "should get index" do
    get kvm_settings_url
    assert_response :success
  end

  test "should get new" do
    get new_kvm_setting_url
    assert_response :success
  end

  test "should create kvm_setting" do
    assert_difference('KvmSetting.count') do
      post kvm_settings_url, params: { kvm_setting: { hypervisor_uri: @kvm_setting.hypervisor_uri, update_interval: @kvm_setting.update_interval, vm_path: @kvm_setting.vm_path } }
    end

    assert_redirected_to kvm_setting_url(KvmSetting.last)
  end

  test "should show kvm_setting" do
    get kvm_setting_url(@kvm_setting)
    assert_response :success
  end

  test "should get edit" do
    get edit_kvm_setting_url(@kvm_setting)
    assert_response :success
  end

  test "should update kvm_setting" do
    patch kvm_setting_url(@kvm_setting), params: { kvm_setting: { hypervisor_uri: @kvm_setting.hypervisor_uri, update_interval: @kvm_setting.update_interval, vm_path: @kvm_setting.vm_path } }
    assert_redirected_to kvm_setting_url(@kvm_setting)
  end

  test "should destroy kvm_setting" do
    assert_difference('KvmSetting.count', -1) do
      delete kvm_setting_url(@kvm_setting)
    end

    assert_redirected_to kvm_settings_url
  end
end
