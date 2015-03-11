class Customer < ActiveRecord::Base
  has_many :addresses, :primary_key => :shopify_id, :dependent => :destroy

  def self.import
    @shopify_customers = ShopifyAPI::Customer.find(:all)
    @shopify_customers.each do |shopify_customer|
      next if Customer.find_by_shopify_id(shopify_customer.id)
      customer = Customer.new
      customer.accepts_marketing = shopify_customer.accepts_marketing
      customer.shopify_created_at = shopify_customer.created_at
      customer.default_address_address1 = shopify_customer.default_address.address1
      customer.default_address_address2 = shopify_customer.default_address.address2
      customer.default_address_city = shopify_customer.default_address.city
      customer.default_address_company = shopify_customer.default_address.company
      customer.default_address_country = shopify_customer.default_address.country
      customer.default_address_first_name = shopify_customer.default_address.first_name
      customer.default_address_id = shopify_customer.default_address.id
      customer.default_address_last_name = shopify_customer.default_address.last_name
      customer.default_address_phone = shopify_customer.default_address.phone
      customer.default_address_province = shopify_customer.default_address.province
      customer.default_address_zip = shopify_customer.default_address.zip
      customer.default_address_province_code = shopify_customer.default_address.province_code
      customer.default_address_country_code = shopify_customer.default_address.country_code
      customer.default_address_default = shopify_customer.default_address.default
      customer.email = shopify_customer.email
      customer.first_name = shopify_customer.first_name
      customer.shopify_id = shopify_customer.id
      customer.last_name = shopify_customer.last_name
      customer.last_order_id = shopify_customer.last_order_id
      customer.last_order_name = shopify_customer.last_order_name
      customer.note = shopify_customer.note
      customer.orders_count = shopify_customer.orders_count
      customer.state = shopify_customer.state
      customer.tags = shopify_customer.tags
      customer.total_spent = shopify_customer.total_spent
      customer.updated_at = shopify_customer.updated_at
      customer.verified_email = shopify_customer.verified_email
      customer.save
    end
  end

end
