class AddNameEmailHomepageToComments < ActiveRecord::Migration
  def self.up
    add_column :comments, :name, :string
    add_column :comments, :email, :string
    add_column :comments, :homepage, :string
  end

  def self.down
    remove_column :comments, :name
    remove_column :comments, :email
    remove_column :comments, :homepage
  end
end
