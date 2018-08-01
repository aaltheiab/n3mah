class CreateBranches < ActiveRecord::Migration[5.2]
  def change
    create_table :branches do |t|
      t.references :center
      t.float :lat
      t.float :lng
      t.integer :capacity
      t.string :status
      t.integer :current_quantity
      t.datetime :last_updated_at
      t.timestamps null: false
    end
  end
end
