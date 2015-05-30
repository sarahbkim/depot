require 'test_helper'

class CartTest < ActiveSupport::TestCase
  fixtures :products, :carts
  # test "the truth" do
  #   assert true
  # end

  test "cart should create an empty cart" do
    cart = Cart.new
    cart.add_product(products(:ruby).id)
    cart.add_product(products(:one).id)
    assert_equal 2, cart.line_items.size
    assert 59.49, cart.total_price
  end

  test "cart line item should save price" do
    cart = carts(:cart1)
    [:ruby, :one, :ruby].each do |which_product|
        product = products(which_product)
        item = cart.add_product(product.id)
        assert_equal item.price, product.price, "cart line item did not save the price"
    end
  end
end
