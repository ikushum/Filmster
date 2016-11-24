class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :voter_id
      t.integer :votable_id
      t.timestamps null: false
    end
    add_index :votes, :voter_id
    add_index :votes, :votable_id
    add_index :votes, [:voter_id, :votable_id]
  end
end
