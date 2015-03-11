class AddProductAttributestoProducts < ActiveRecord::Migration
  def change
    add_column :products, :title, :text
    add_column :products, :body_html, :text
    add_column :products, :shopify_created_at, :datetime
    add_column :products, :handle, :text
    add_column :products, :images, :text
    add_column :products, :options, :text
    add_column :products, :product_type, :text
    add_column :products, :published_at, :datetime
    add_column :products, :published_scope, :text
    add_column :products, :tags, :text
    add_column :products, :shopify_updated_at, :datetime
    add_column :products, :vendor, :text
  end
end
