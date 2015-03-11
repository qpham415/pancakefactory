class AddShopifyCreatedToVariants < ActiveRecord::Migration
  def change
    add_column :variants, :shopify_created_at, :datetime
  end
end
