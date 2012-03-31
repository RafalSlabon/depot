require 'test_helper'

class ProductTest < ActiveSupport::TestCase

  #fixtures :products

  test "product attributes should not be empty" do
     product = Product.new
     assert product.invalid?
     assert product.errors[:title].any?
     assert product.errors[:description].any?
     assert product.errors[:price].any?
     assert product.errors[:image_url].any?
  end

  test "product price must be positive" do
    product = Product.new(
      :title => "Test Title",
      :description => "Test Description",
      :image_url => "test.gif"
    )
    product.price = -1

    assert product.invalid?

    assert_equal "must be greater than or equal to 0.01", product.errors[:price].join("; ")

    product.price = 0

    assert product.invalid?

    assert_equal "must be greater than or equal to 0.01", product.errors[:price].join("; ")

    product.price = 1

    assert product.valid?

  end
end
