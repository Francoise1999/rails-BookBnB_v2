class AddUserRefToBooks < ActiveRecord::Migration[7.0]
  def change
    remove_column :books, :user_id, :integer
    add_reference :books, :user, null: false, foreign_key: true
  end
end
