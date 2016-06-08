class CreateStatements < ActiveRecord::Migration
  def change
    create_table :statements do |t|
      t.references :user, index: true, foreign_key: true
      t.string :Title

      t.timestamps null: false
    end
  end
end
