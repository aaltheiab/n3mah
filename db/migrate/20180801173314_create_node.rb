class CreateNode < ActiveRecord::Migration[5.2]
  def change
    create_table :nodes do |t|
      t.float :lat
      t.float :lng
      t.references :branch
      t.integer :capacity
      t.integer :current_quantity
      t.string :status
      t.timestamps null: false
    end
  end
end
