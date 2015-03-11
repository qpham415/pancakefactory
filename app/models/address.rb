class Address < ActiveRecord::Base
  belongs_to :customer, :foreign_key => :customer_id

  def self.import
    @shopify_customers = ShopifyAPI::Customer.find(:all)
    @shopify_customers.each do |shopify_customer|
      shopify_customer.addresses.each do |shopify_address|
        next if Address.find_by_shopify_id(shopify_address.id)
        address = Address.new
        address.shopify_id = shopify_address.id
        address.customer_id = shopify_customer.id
        address.address1 = shopify_address.address1
        address.address2 = shopify_address.address2
        address.city = shopify_address.city
        address.company = shopify_address.company
        address.first_name = shopify_address.first_name
        address.last_name = shopify_address.last_name
        address.phone = shopify_address.phone
        address.province = shopify_address.province
        address.country = shopify_address.country
        address.zip = shopify_address.zip
        address.name = shopify_address.name
        address.province_code = shopify_address.province_code
        address.country_code = shopify_address.country_code
        address.country_name = shopify_address.country_name
        address.save
      end
    end
  end
end
