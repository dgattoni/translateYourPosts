class AddQuantityToPost < ActiveRecord::Migration
  def change
    add_column :posts, :quantity, :integer
  end
end
