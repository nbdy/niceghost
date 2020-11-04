json.extract! kvm_setting, :id, :hypervisor_uri, :update_interval, :vm_path, :created_at, :updated_at
json.url kvm_setting_url(kvm_setting, format: :json)
