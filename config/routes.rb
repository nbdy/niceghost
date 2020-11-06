Rails.application.routes.draw do
  get 'dashboard/index'

  get 'control/start'
  get 'control/stop'
  get 'control/restart'
  get 'control/configure'

  get '', to: 'dashboard#index'

  get 'vms/search'

  resources :kvm_settings, controller: 'kvm_settings'
  resources :vms, controller: 'vms'
end
