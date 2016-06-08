class AddUserIdtoStatements < ActiveRecord::Migration
  def change
    add_reference :users, :statement, index: true, foreign_key: true
  end
end
