class AddAfterNItemsToProductSpecificPrice < ActiveRecord::Migration[5.1]
  def change
    add_column :product_specific_prices, :after_n_items, :integer, null: false, default: 0
  end
end
