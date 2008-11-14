class AddPasswordSaltAndHash < ActiveRecord::Migration
  def self.up
    rename_column :users, :password, :password_salt
    add_column :users, :password_hash, :string
  end

  def self.down
    rename_column :users, :password_salt, :password
    remove_column :users, :password_hash
  end
end
