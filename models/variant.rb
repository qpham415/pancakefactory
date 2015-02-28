class Variant < ActiveRecord::Base
  belongs_to :shopify_id, :class_name => "Product"

  def self.import
    @shopify_products = ShopifyAPI::Product.find(:all)
    @shopify_products.each do |shopify_product|
      shopify_product.variants.each do |shopify_product_variant|
        variant = Variant.new
        variant.product_id = shopify_product_variant.product_id
        variant.price = shopify_product_variant.price
        variant.barcode = shopify_product_variant.barcode
        variant.grams = shopify_product_variant.grams
        variant.save
      end
    end
  end

end
