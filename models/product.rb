class Product < ActiveRecord::Base

  def self.import
    @shopify_products = ShopifyAPI::Product.find(:all)
    @shopify_products.each do |shopify_product|
      next if Product.find_by_shopify_id(shopify_product.id)
      product = Product.new
      product.shopify_id = shopify_product.id
      product.title = shopify_product.title
      product.body_html = shopify_product.body_html
      product.shopify_created_at = shopify_product.created_at
      product.handle = shopify_product.handle
      product.images = shopify_product.images
      product.options = shopify_product.options
      product.product_type = shopify_product.product_type
      product.published_at = shopify_product.published_at
      product.published_scope = shopify_product.published_scope
      product.tags = shopify_product.tags
      product.updated_ad = shopify_product.updated_at
      product.vendor = shopify_product.vendor
      product.save
    end
  end

end
