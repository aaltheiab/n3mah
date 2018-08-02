class AddNameToBrandh < ActiveRecord::Migration[5.2]
  def change
    add_column :branches, :name, :string
  end
end
