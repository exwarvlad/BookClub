class AddUserNameToUser < ActiveRecord::Migration
  def change
    add_column :books, :user_name, :string, default: '', null: false
  end
end
