class CreateKvmSettings < ActiveRecord::Migration[6.0]
  def change
    create_table :kvm_settings do |t|
      t.string :hypervisor_uri
      t.integer :update_interval
      t.string :vm_path

      t.timestamps
    end
  end
end
