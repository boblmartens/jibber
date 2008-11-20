class UpdateAdminAttributeToFalse < ActiveRecord::Migration
  def self.up
    change_column :users, :admin, :boolean, :default => false
  end

  def self.down
    change_column :users, :admin, :boolean
  end
end
