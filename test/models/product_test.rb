require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  fixtures :products
  # test "the truth" do
  #   assert true
  # end
  test "product attributes must not be empty" do
  	product = Product.new
  	assert product.invalid?
  	assert product.errors[:title].any?
  	assert product.errors[:description].any?
  	assert product.errors[:price].any?
  	assert product.errors[:image_url].any?
  end

  test "product is not valid without a unique title - i18n" do
    product = Product.new(title: products(:ruby).title,
                          description: "yyy",
                          price: 1,
                          image_url: "fred.gif")
    assert product.invalid?
    assert_equal [I18n.translate('errors.messages.taken')], 
    product.errors[:title]
  end

  test "product title must be at least 10 character long" do
    product = Product.new(title: "Some Title",
                          description: "Some description",
                          price: 1,
                          image_url: "some.png")
    assert product.valid?
    product.title = "Any Title" 
    assert product.invalid?
    min_title_size = Product.validators_on(:title).select { |v| v.class == ActiveModel::Validations::LengthValidator}.first.options[:minimum]
    assert_equal ["must have at least #{min_title_size} characters"], product.errors[:title]
end
end
