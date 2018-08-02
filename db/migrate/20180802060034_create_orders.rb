class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :status
      t.integer :quantity
      t.references :user
      t.integer :owner_id
      t.string :owner_type
      t.timestamps null: false
    end
  end
end
