class ControlController < ApplicationController
  before_action :_get_kvm, only: %i[start stop restart configure]

  def start
    (@kvm.find_domain_by_name params[:name]).create
  end

  def stop
    (@kvm.find_domain_by_name params[:name]).shutdown(true)
  end

  def restart
    stop
    start
  end

  def configure
    puts 'configure', params # todo
  end

  def upload
    puts 'upload', params # todo
  end

  private

  def _get_kvm
    @kvm = Virtually.connect KvmSetting.first.hypervisor_uri if @kvm.nil?
  end
end
