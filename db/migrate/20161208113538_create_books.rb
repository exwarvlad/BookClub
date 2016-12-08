class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :avatar_title
      t.string :author
      t.text :description
      t.references :user, index: true, foreign_keys: true

      t.timestamps null: false
    end
  end
end
