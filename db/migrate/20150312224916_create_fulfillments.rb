class CreateFulfillments < ActiveRecord::Migration
  def change
    create_table :fulfillments do |t|
      t.datetime :shopify_created_at
      t.integer :shopify_id
      t.integer :order_id
      t.text :status
      t.text :tracking_company
      t.text :tracking_number
      t.datetime :updated_at

      t.timestamps null: false
    end
    add_foreign_key :fulfillments, :orders
  end
end
