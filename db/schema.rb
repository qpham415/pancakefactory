# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150312224916) do

  create_table "addresses", force: :cascade do |t|
    t.integer  "shopify_id"
    t.integer  "customer_id"
    t.text     "address1"
    t.text     "address2"
    t.text     "city"
    t.text     "company"
    t.text     "first_name"
    t.text     "last_name"
    t.text     "phone"
    t.text     "province"
    t.text     "country"
    t.text     "zip"
    t.text     "name"
    t.text     "province_code"
    t.text     "country_code"
    t.text     "country_name"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "customers", force: :cascade do |t|
    t.boolean  "accepts_marketing"
    t.datetime "shopify_created_at"
    t.text     "default_address_address1"
    t.text     "default_address_address2"
    t.text     "default_address_city"
    t.text     "default_address_company"
    t.text     "default_address_country"
    t.text     "default_address_first_name"
    t.integer  "default_address_id"
    t.text     "default_address_last_name"
    t.text     "default_address_phone"
    t.text     "default_address_province"
    t.integer  "default_address_zip"
    t.text     "default_address_province_code"
    t.text     "default_address_country_code"
    t.boolean  "default_address_default"
    t.text     "email"
    t.text     "first_name"
    t.text     "shopify_id"
    t.text     "last_name"
    t.integer  "last_order_id"
    t.text     "last_order_name"
    t.text     "note"
    t.integer  "orders_count"
    t.text     "state"
    t.text     "tags"
    t.float    "total_spent"
    t.datetime "updated_at",                    null: false
    t.boolean  "verified_email"
    t.datetime "created_at",                    null: false
  end

  create_table "fulfillments", force: :cascade do |t|
    t.datetime "shopify_created_at"
    t.integer  "shopify_id"
    t.integer  "order_id"
    t.text     "status"
    t.text     "tracking_company"
    t.text     "tracking_number"
    t.datetime "updated_at",         null: false
    t.datetime "created_at",         null: false
  end

  create_table "items", force: :cascade do |t|
    t.string   "title"
    t.float    "price_range"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "orders", force: :cascade do |t|
    t.text     "billing_address_address1"
    t.text     "billing_address_address2"
    t.text     "billing_address_city"
    t.text     "billing_address_company"
    t.text     "billing_address_country"
    t.text     "billing_address_first_name"
    t.integer  "billing_address_id"
    t.text     "billing_address_last_name"
    t.text     "billing_address_phone"
    t.text     "billing_address_province"
    t.text     "billing_address_zip"
    t.text     "billing_address_name"
    t.text     "billing_address_province_code"
    t.text     "billing_address_country_code"
    t.boolean  "billing_address_default"
    t.text     "browser_ip"
    t.boolean  "buyer_accepts_marketing"
    t.text     "cancel_reason"
    t.text     "cancelled_at"
    t.text     "cart_token"
    t.text     "client_details_accept_language"
    t.integer  "client_details_browser_height"
    t.text     "client_details_browser_ip"
    t.integer  "client_details_browser_width"
    t.text     "client_details_session_hash"
    t.text     "client_details_user_agent"
    t.text     "closed_at"
    t.datetime "shopify_created_at"
    t.text     "currency"
    t.boolean  "customer_accepts_marketing"
    t.datetime "customer_created_at"
    t.text     "customer_email"
    t.text     "customer_first_name"
    t.integer  "customer_id"
    t.text     "customer_last_name"
    t.integer  "customer_orders_count"
    t.text     "customer_state"
    t.float    "customer_total_spent"
    t.datetime "customer_updated_at"
    t.text     "customer_tags"
    t.text     "discount_codes"
    t.text     "email"
    t.text     "financial_status"
    t.datetime "filfillments_created_at"
    t.integer  "fulfillments_id"
    t.integer  "fulfillments_order_id"
    t.text     "filfillments_status"
    t.text     "filfillments_tracking_company"
    t.text     "filfillments_tracking_number"
    t.datetime "fulfillments_updated_at"
    t.text     "fulfillment_status"
    t.text     "tags"
    t.text     "gateway"
    t.integer  "shopify_id"
    t.text     "landing_site"
    t.integer  "line_items_fulfillable_quantity"
    t.text     "line_items_fulfillment_service"
    t.text     "line_items_fulfillment_status"
    t.float    "line_items_grams"
    t.integer  "line_items_id"
    t.float    "line_items_price"
    t.integer  "line_items_product_id"
    t.integer  "line_items_quantity"
    t.boolean  "line_items_requires_shipping"
    t.text     "line_items_sku"
    t.text     "line_items_title"
    t.integer  "line_items_variant_id"
    t.text     "line_items_variant_title"
    t.text     "line_items_vendor"
    t.text     "line_items_name"
    t.boolean  "line_items_gift_card"
    t.boolean  "line_items_taxable"
    t.text     "line_items_tax_lines"
    t.text     "name"
    t.text     "note"
    t.text     "note_attributes"
    t.integer  "number"
    t.text     "order_number"
    t.text     "payment_details_avs_result_code"
    t.text     "payment_details_credit_card_bin"
    t.text     "payment_details_cvv_result_code"
    t.text     "payment_details_credit_card_number"
    t.text     "payment_details_credit_card_company"
    t.datetime "processed_at"
    t.text     "processing_method"
    t.text     "referring_site"
    t.text     "shipping_address_address1"
    t.text     "shipping_address_address2"
    t.text     "shipping_address_city"
    t.text     "shipping_address_company"
    t.text     "shipping_address_country"
    t.text     "shipping_address_first_name"
    t.text     "shipping_address_last_name"
    t.float    "shipping_address_latitude"
    t.float    "shipping_address_longitude"
    t.text     "shipping_address_phone"
    t.text     "shipping_address_province"
    t.text     "shipping_address_zip"
    t.text     "shipping_address_name"
    t.text     "shipping_address_country_code"
    t.text     "shipping_address_province_code"
    t.text     "shipping_lines_code"
    t.float    "shipping_lines_price"
    t.text     "shipping_lines_source"
    t.text     "shipping_lines_title"
    t.text     "shipping_lines_tax_lines"
    t.text     "source_name"
    t.float    "subtotal_price"
    t.float    "tax_lines_price"
    t.float    "tax_lines_rate"
    t.text     "tax_lines_title"
    t.boolean  "taxes_included"
    t.text     "token"
    t.float    "total_discounts"
    t.float    "total_line_items_price"
    t.float    "total_price"
    t.float    "total_tax"
    t.float    "total_weight"
    t.datetime "updated_at",                          null: false
    t.datetime "created_at",                          null: false
  end

  create_table "products", force: :cascade do |t|
    t.integer  "shopify_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.text     "title"
    t.text     "body_html"
    t.datetime "shopify_created_at"
    t.text     "handle"
    t.text     "images"
    t.text     "options"
    t.text     "product_type"
    t.datetime "published_at"
    t.text     "published_scope"
    t.text     "tags"
    t.datetime "shopify_updated_at"
    t.text     "vendor"
  end

  add_index "products", ["shopify_id"], name: "index_products_on_shopify_id"

  create_table "variants", force: :cascade do |t|
    t.text     "barcode"
    t.float    "compare_at_price"
    t.datetime "created_at",                    null: false
    t.text     "fulfillment_service"
    t.float    "grams"
    t.integer  "shopify_id"
    t.text     "inventory_management"
    t.text     "inventory_policy"
    t.integer  "inventory_quantity"
    t.integer  "old_inventory_quantity"
    t.integer  "inventory_quantity_adjustment"
    t.text     "option"
    t.integer  "position"
    t.float    "price"
    t.integer  "product_id"
    t.boolean  "requires_shipping"
    t.text     "sku"
    t.boolean  "taxable"
    t.text     "title"
    t.datetime "updated_at",                    null: false
    t.integer  "image_id"
    t.datetime "shopify_created_at"
  end

end
