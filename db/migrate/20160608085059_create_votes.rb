class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.boolean :verdict

      t.timestamps null: false
    end
  end
end
