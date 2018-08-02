class AddBranchToUser < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :branch, foreign_key: true
  end
end
