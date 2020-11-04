require "application_system_test_case"

class KvmSettingsTest < ApplicationSystemTestCase
  setup do
    @kvm_setting = kvm_settings(:one)
  end

  test "visiting the index" do
    visit kvm_settings_url
    assert_selector "h1", text: "Kvm Settings"
  end

  test "creating a Kvm setting" do
    visit kvm_settings_url
    click_on "New Kvm Setting"

    fill_in "Hypervisor uri", with: @kvm_setting.hypervisor_uri
    fill_in "Update interval", with: @kvm_setting.update_interval
    fill_in "Vm path", with: @kvm_setting.vm_path
    click_on "Create Kvm setting"

    assert_text "Kvm setting was successfully created"
    click_on "Back"
  end

  test "updating a Kvm setting" do
    visit kvm_settings_url
    click_on "Edit", match: :first

    fill_in "Hypervisor uri", with: @kvm_setting.hypervisor_uri
    fill_in "Update interval", with: @kvm_setting.update_interval
    fill_in "Vm path", with: @kvm_setting.vm_path
    click_on "Update Kvm setting"

    assert_text "Kvm setting was successfully updated"
    click_on "Back"
  end

  test "destroying a Kvm setting" do
    visit kvm_settings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Kvm setting was successfully destroyed"
  end
end
