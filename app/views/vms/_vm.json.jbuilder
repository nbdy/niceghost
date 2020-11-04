json.extract! vm, :id, :name, :cpu_count, :memory, :state, :created_at, :updated_at
json.url vm_url(vm, format: :json)
