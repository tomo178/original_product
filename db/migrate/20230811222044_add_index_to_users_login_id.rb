class AddIndexToUsersLoginId < ActiveRecord::Migration[7.0]
  def change
    add_index :users, :loginID, unique: true
  end
end
