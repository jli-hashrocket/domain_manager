class CreateDomains < ActiveRecord::Migration
  def change
    create_table :domains do |t|
      t.string :hostname, null:false
      t.string :ip_address, null:false

      t.timestamps
    end
  end
end
