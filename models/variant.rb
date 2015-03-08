class Variant < ActiveRecord::Base
  belongs_to :product, :foreign_key => :product_id

  def self.import
    @shopify_products = ShopifyAPI::Product.find(:all)
    @shopify_products.each do |shopify_product|
      shopify_product.variants.each do |shopify_variant|
        next if Variant.find_by_shopify_id(shopify_variant.id)
        variant = Variant.new
        variant.barcode = shopify_variant.barcode
        variant.compare_at_price = shopify_variant.compare_at_price
        variant.shopify_created_at = shopify_variant.created_at
        variant.fulfillment_service = shopify_variant.fulfillment_service
        variant.grams = shopify_variant.grams
        variant.shopify_id = shopify_variant.id
        variant.inventory_management = shopify_variant.inventory_management
        variant.inventory_policy = shopify_variant.inventory_policy
        variant.inventory_quantity = shopify_variant.inventory_quantity
        variant.old_inventory_quantity = shopify_variant.old_inventory_quantity
        #variant.inventory_quantity_adjustment = shopify_variant.inventory_quantity_adjustment
        #variant.option = shopify_variant.option
        variant.position = shopify_variant.position
        variant.price = shopify_variant.price
        variant.product_id = shopify_variant.product_id
        variant.requires_shipping = shopify_variant.requires_shipping
        variant.sku = shopify_variant.sku
        variant.taxable = shopify_variant.taxable
        variant.title = shopify_variant.title
        variant.updated_at = shopify_variant.updated_at
        variant.image_id = shopify_variant.image_id
        variant.save
      end
    end
  end

end
