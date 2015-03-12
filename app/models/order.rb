class Order < ActiveRecord::Base
  has_many :fulfillments, :primary_key => :shopify_id, :dependent => :destroy

  def self.import
    @shopify_orders = ShopifyAPI::Order.find(:all)
    @shopify_orders.each do |shopify_order|
      next if Order.find_by_shopify_id(shopify_order.id)
      order = Order.new
      order.billing_address_address1 = shopify_order.billing_address.address1
      order.billing_address_address2 = shopify_order.billing_address.address2
      order.billing_address_city = shopify_order.billing_address.city
      order.billing_address_company = shopify_order.billing_address.company
      order.billing_address_country = shopify_order.billing_address.country
      order.billing_address_first_name = shopify_order.billing_address.first_name
      order.billing_address_id = shopify_order.billing_address.id
      order.billing_address_last_name = shopify_order.billing_address.last_name
      order.billing_address_phone = shopify_order.billing_address.phone
      order.billing_address_province = shopify_order.billing_address.province
      order.billing_address_zip = shopify_order.billing_address.zip
      order.billing_address_name = shopify_order.billing_address.name
      order.billing_address_province_code = shopify_order.billing_address.province_code
      order.billing_address_country_code = shopify_order.billing_address.country_code
      #order.billing_address_default = shopify_order.billing_address.default

      order.browser_ip = shopify_order.browser_ip
      order.buyer_accepts_marketing = shopify_order.buyer_accepts_marketing
      order.cancel_reason = shopify_order.cancel_reason
      order.cancelled_at = shopify_order.cancelled_at
      order.cart_token = shopify_order.cart_token

      order.client_details_accept_language = shopify_order.client_details.accept_language
      order.client_details_browser_height = shopify_order.client_details.browser_height
      order.client_details_browser_ip = shopify_order.client_details.browser_ip
      order.client_details_browser_width = shopify_order.client_details.browser_width
      order.client_details_session_hash = shopify_order.client_details.session_hash
      order.client_details_user_agent = shopify_order.client_details.user_agent

      order.closed_at = shopify_order.closed_at
      order.shopify_created_at = shopify_order.created_at
      order.currency = shopify_order.currency

      order.customer_accepts_marketing = shopify_order.customer.accepts_marketing
      order.customer_created_at = shopify_order.customer.created_at
      order.customer_email = shopify_order.customer.email
      order.customer_first_name = shopify_order.customer.first_name
      order.customer_id = shopify_order.customer.id
      order.customer_last_name = shopify_order.customer.last_name
      order.customer_orders_count = shopify_order.customer.orders_count
      order.customer_state = shopify_order.customer.state
      order.customer_total_spent = shopify_order.customer.total_spent
      order.customer_updated_at = shopify_order.customer.updated_at
      order.customer_tags = shopify_order.customer.tags

      order.discount_codes = shopify_order.discount_codes
      order.email = shopify_order.email
      order.financial_status = shopify_order.financial_status

      #order.filfillments_created_at = shopify_order.fulfillments.created_at
      #order.fulfillments_id = shopify_order.fulfillments.id
      #order.fulfillments_order_id = shopify_order.fulfillments.order_id
      #order.filfillments_status = shopify_order.fulfillments.status
      #order.filfillments_tracking_company = shopify_order.fulfillments.tracking_company
      #order.filfillments_tracking_number = shopify_order.fulfillments.tracking_number
      #order.fulfillments_updated_at = shopify_order.fulfillments.updated_at

      order.fulfillment_status = shopify_order.fulfillment_status
      order.tags = shopify_order.tags
      order.gateway = shopify_order.gateway
      order.shopify_id = shopify_order.id
      order.landing_site = shopify_order.landing_site

      #order.line_items_fulfillable_quantity = shopify_order.line_items.fulfillable_quantity
      #order.line_items_fulfillment_service = shopify_order.line_items.fulfillment_service
      #order.line_items_fulfillment_status = shopify_order.line_items.fulfillment_status
      #order.line_items_grams = shopify_order.line_items.grams
      #order.line_items_id = shopify_order.line_items.id
      #order.line_items_price = shopify_order.line_items.price
      #order.line_items_product_id = shopify_order.line_items.product_id
      #order.line_items_quantity = shopify_order.line_items.quantity
      #order.line_items_requires_shipping = shopify_order.line_items.requires_shipping
      #order.line_items_sku = shopify_order.line_items.sku
      #order.line_items_title = shopify_order.line_items.title
      #order.line_items_variant_id = shopify_order.line_items.variant_id
      #order.line_items_variant_title = shopify_order.line_items.variant_title
      #order.line_items_vendor = shopify_order.line_items.vendor
      #order.line_items_name = shopify_order.line_items.name
      #order.line_items_gift_card = shopify_order.line_items.gift_card
      #order.line_items_taxable = shopify_order.line_items.taxable
      #order.line_items_tax_lines = shopify_order.line_items.tax_lines

      order.name = shopify_order.name
      order.note = shopify_order.note
      order.note_attributes = shopify_order.note_attributes
      order.number = shopify_order.number
      order.order_number = shopify_order.order_number

      order.payment_details_avs_result_code = shopify_order.payment_details.avs_result_code
      order.payment_details_credit_card_bin = shopify_order.payment_details.credit_card_bin
      order.payment_details_cvv_result_code = shopify_order.payment_details.cvv_result_code
      order.payment_details_credit_card_number = shopify_order.payment_details.credit_card_number
      order.payment_details_credit_card_company = shopify_order.payment_details.credit_card_company

      order.processed_at = shopify_order.processed_at
      order.processing_method = shopify_order.processing_method
      order.referring_site = shopify_order.referring_site

      order.shipping_address_address1 = shopify_order.shipping_address.address1
      order.shipping_address_address2 = shopify_order.shipping_address.address2
      order.shipping_address_city = shopify_order.shipping_address.city
      order.shipping_address_company = shopify_order.shipping_address.company
      order.shipping_address_country = shopify_order.shipping_address.country
      order.shipping_address_first_name = shopify_order.shipping_address.first_name
      order.shipping_address_last_name = shopify_order.shipping_address.last_name
      order.shipping_address_latitude = shopify_order.shipping_address.latitude
      order.shipping_address_longitude = shopify_order.shipping_address.longitude
      order.shipping_address_phone = shopify_order.shipping_address.phone
      order.shipping_address_province = shopify_order.shipping_address.province
      order.shipping_address_zip = shopify_order.shipping_address.zip
      order.shipping_address_name = shopify_order.shipping_address.name
      order.shipping_address_country_code = shopify_order.shipping_address.country_code
      order.shipping_address_province_code = shopify_order.shipping_address.province_code

      #order.shipping_lines_code = shopify_order.shipping_lines.code
      #order.shipping_lines_price = shopify_order.shipping_lines.price
      #order.shipping_lines_source = shopify_order.shipping_lines.source
      #order.shipping_lines_title = shopify_order.shipping_lines.title
      #order.shipping_lines_tax_lines = shopify_order.shipping_lines.tax_lines

      order.source_name = shopify_order.source_name
      order.subtotal_price = shopify_order.subtotal_price

      #order.tax_lines_price = shopify_order.tax_lines.price
      #order.tax_lines_rate = shopify_order.tax_lines.rate
      #order.tax_lines_title = shopify_order.tax_lines.title

      order.taxes_included = shopify_order.taxes_included
      order.token = shopify_order.token
      order.total_discounts = shopify_order.total_discounts
      order.total_line_items_price = shopify_order.total_line_items_price
      order.total_price = shopify_order.total_price
      order.total_tax = shopify_order.total_tax
      order.total_weight = shopify_order.total_weight
      order.updated_at = shopify_order.updated_at
      order.save
    end
  end

end
