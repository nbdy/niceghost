class CreateVms < ActiveRecord::Migration[6.0]
  def change
    create_table :vms do |t|
      t.string :name
      t.integer :cpu_count
      t.bigint :memory
      t.string :state

      t.timestamps
    end
  end
end
