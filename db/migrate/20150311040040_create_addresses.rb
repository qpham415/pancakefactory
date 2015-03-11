class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.integer :shopify_id
      t.integer :customer_id
      t.text :address1
      t.text :address2
      t.text :city
      t.text :company
      t.text :first_name
      t.text :last_name
      t.text :phone
      t.text :province
      t.text :country
      t.text :zip
      t.text :name
      t.text :province_code
      t.text :country_code
      t.text :country_name

      t.timestamps null: false
    end
    add_foreign_key :addresses, :customers
  end
end
