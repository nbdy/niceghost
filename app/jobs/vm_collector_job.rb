class VmCollectorJob < ApplicationJob
  queue_as :default

  def initialize(*arguments)
    @setting = KvmSetting.first
    if @setting.nil?
      @setting = KvmSetting.new
      @setting.hypervisor_uri = 'qemu:///system'
      @setting.update_interval = 5
      @setting.vm_path = ''
      @setting.save
    end
    @hypervisor = Virtually.connect @setting.hypervisor_uri

    super
  end

  def index_vm(domain)
    vm = Vm.find_by_name domain.name
    if vm.nil?
      vm = Vm.new
    end
    vm.name = domain.name
    vm.cpu_count = domain.vcpu
    vm.memory = domain.memory / 1024 / 1024
    vm.state = domain.active? ? 'active' : 'inactive'
    vm.save
  end

  def index_vms
    @hypervisor.inactive_domain_names.each do |name|
      index_vm(@hypervisor.find_domain_by_name(name))
    end

    @hypervisor.active_domain_ids.each do |id|
      index_vm @hypervisor.find_domain_by_id id
    end
  end

  def perform(*_args)
    loop do
      index_vms
      sleep @setting.update_interval
    end
  end
end