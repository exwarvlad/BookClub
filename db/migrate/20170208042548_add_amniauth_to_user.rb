class AddAmniauthToUser < ActiveRecord::Migration
  def change
    add_column :users, :provider, :string
    add_column :users, :uid, :string
    change_column :users, :email, :string, null: true
  end
end
