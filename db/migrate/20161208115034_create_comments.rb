class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body
      t.references :user, index: true, foreign_keys: true
      t.references :book, index: true, foreign_keys: true

      t.timestamps null: false
    end
  end
end
