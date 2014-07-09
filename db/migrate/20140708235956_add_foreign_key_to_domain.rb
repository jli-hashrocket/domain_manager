class AddForeignKeyToDomain < ActiveRecord::Migration
  def up
    add_column :domains, :account_id, :integer, null: false
  end

  def down
    remove_column :domains, :account_id
  end
end
