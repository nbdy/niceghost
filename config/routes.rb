Rails.application.routes.draw do
  get 'control/start'
  get 'control/stop'
  get 'control/restart'
  get 'control/configure'

  resources :kvm_settings, controller: 'kvm_settings'
  resources :vms, controller: 'vms'
end
