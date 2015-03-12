class Fulfillment < ActiveRecord::Base
  belongs_to :order, :foreign_key => :order_id

  def self.import
    @shopify_orders = ShopifyAPI::Order.find(:all)
    @shopify_orders.each do |shopify_order|
      shopify_order.fulfillments.each do |shopify_fulfillment|
        next if Fulfillment.find_by_shopify_id(shopify_fulfillment.id)
        fulfillment = Fulfillment.new

        fulfillment.shopify_created_at = shopify_fulfillment.created_at
        fulfillment.shopify_id = shopify_fulfillment.id
        fulfillment.status = shopify_fulfillment.status
        fulfillment.tracking_company = shopify_fulfillment.tracking_company
        fulfillment.tracking_number = shopify_fulfillment.tracking_number
        fulfillment.updated_at = shopify_fulfillment.updated_at
        fulfillment.order_id = shopify_order.id

        fulfillment.save
      end
    end
  end
end
