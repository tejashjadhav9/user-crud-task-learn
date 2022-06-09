class Change < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :blog, :string
  end
end
