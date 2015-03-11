class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.boolean :accepts_marketing
      t.datetime :shopify_created_at
      t.text :default_address_address1
      t.text :default_address_address2
      t.text :default_address_city
      t.text :default_address_company
      t.text :default_address_country
      t.text :default_address_first_name
      t.integer :default_address_id
      t.text :default_address_last_name
      t.text :default_address_phone
      t.text :default_address_province
      t.integer :default_address_zip
      t.text :default_address_province_code
      t.text :default_address_country_code
      t.boolean :default_address_default
      t.text :email
      t.text :first_name
      t.text :shopify_id
      t.text :last_name
      t.integer :last_order_id
      t.text :last_order_name
      t.text :note
      t.integer :orders_count
      t.text :state
      t.text :tags
      t.float :total_spent
      t.datetime :updated_at
      t.boolean :verified_email

      t.timestamps null: false
    end
  end
end
