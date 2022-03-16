class AdColumnToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :images, :string
  end
  end
