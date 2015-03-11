class AddIndexToProducts < ActiveRecord::Migration
  def change
    add_index :products, :shopify_id
  end
end
