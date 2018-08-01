class CreateCenterTable < ActiveRecord::Migration[5.2]
  def change
    create_table :centers do |t|
      t.timestamps null: false
      t.float :lat
      t.float :lng
      t.jsonb :name
      t.string :status
      t.integer :capacity
    end
  end
end
