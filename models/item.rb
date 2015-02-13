class Item < ActiveRecord::Base

  def self.import
    @products = ShopifyAPI::Product.find(:all, :params => {:limit => 10})
    @products.each do |product|
      #next if Item.find_by_shopify_id(product.id)
      item = Item.new
      #item.shopify_id = product.id
      item.title = product.title
      item.price_range = product.price_range
      item.save
    end
  end

end
