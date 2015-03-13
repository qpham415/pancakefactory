class LineItem < ActiveRecord::Base
  belongs_to :order, :foreign_key => :order_id

  def self.import
    @shopify_orders = ShopifyAPI::Order.find(:all)
    @shopify_orders.each do |shopify_order|
      shopify_order.line_items.each do |shopify_line_item|
        next if LineItem.find_by_shopify_id(shopify_line_item.id)
        line_item = LineItem.new

        line_item.fulfillable_quantity = shopify_line_item.fulfillable_quantity
        line_item.fulfillment_service = shopify_line_item.fulfillment_service
        line_item.fulfillment_status = shopify_line_item.fulfillment_status
        line_item.grams = shopify_line_item.grams
        line_item.shopify_id = shopify_line_item.id
        line_item.price = shopify_line_item.price
        line_item.product_id = shopify_line_item.product_id
        line_item.quantity = shopify_line_item.quantity
        line_item.requires_shipping = shopify_line_item.requires_shipping
        line_item.sku = shopify_line_item.sku
        line_item.title = shopify_line_item.title
        line_item.variant_id = shopify_line_item.variant_id
        line_item.variant_title = shopify_line_item.variant_title
        line_item.vendor = shopify_line_item.vendor
        line_item.name = shopify_line_item.name
        line_item.gift_card = shopify_line_item.gift_card
        line_item.taxable = shopify_line_item.taxable
        line_item.total_discount = shopify_line_item.total_discount
        line_item.order_id = shopify_order.id

        line_item.save
      end
    end
  end
end
