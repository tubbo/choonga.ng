class AddVotesToLinks < ActiveRecord::Migration
  def change
    add_column :links, :votes, :integer
  end
end
