class AddHomepageToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :homepage, :string
  end

  def self.down
    remove_column :users, :homepage
  end
end
