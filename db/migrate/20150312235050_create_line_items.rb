class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.integer :fulfillable_quantity
      t.text :fulfillment_service
      t.text :fulfillment_status
      t.float :grams
      t.integer :shopify_id
      t.float :price
      t.integer :product_id
      t.integer :quantity
      t.boolean :requires_shipping
      t.text :sku
      t.text :title
      t.integer :variant_id
      t.text :variant_title
      t.text :vendor
      t.text :name
      t.boolean :gift_card
      t.boolean :taxable
      t.float :total_discount
      t.integer :order_id

      t.timestamps null: false
    end
    add_foreign_key :line_items, :orders
  end
end
