class CreateVariants < ActiveRecord::Migration
  def change
    create_table :variants do |t|
      t.text :barcode
      t.float :compare_at_price
      t.datetime :created_at
      t.text :fulfillment_service
      t.float :grams
      t.integer :shopify_id
      t.text :inventory_management
      t.text :inventory_policy
      t.integer :inventory_quantity
      t.integer :old_inventory_quantity
      t.integer :inventory_quantity_adjustment
      t.text :option
      t.integer :position
      t.float :price
      t.integer :product_id
      t.boolean :requires_shipping
      t.text :sku
      t.boolean :taxable
      t.text :title
      t.datetime :updated_at
      t.integer :image_id

      t.timestamps null: false
    end
    add_foreign_key :variants, :products
  end
end
