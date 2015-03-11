class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title
      t.float :price_range

      t.timestamps null: false
    end
  end
end
