class AddPriceToLineitems < ActiveRecord::Migration
  def self.up
    add_column :line_items, :price, :decimal
    LineItem.reset_column_information

    LineItem.all.each do |line_item|
        line_item.update_attribute :price, line_item.product.price
    end
  end

  def self.down
    remove_column :line_items, :price
  end
end
