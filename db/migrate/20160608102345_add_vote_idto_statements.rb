class AddVoteIdtoStatements < ActiveRecord::Migration
  def change
    add_reference :votes, :statement, index: true, foreign_key: true
  end
end
