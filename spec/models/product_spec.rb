require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it "creates product successfully given name, price, quantity and category" do
      @category = Category.create(name: "testCategory")
      @product = Product.new(name: "testProduct", price: 3009, quantity: 100, category_id: @category.id)
      expect(@product.save).not_to be_falsey
    end

    it "fails to create product given price, quantity and category but not name" do
      @category = Category.create(name: "testCategory")
      @product = Product.new(name: nil, price: 3009, quantity: 100, category_id: @category.id)
      
      expect(@product.save).to be_falsey
      # make sure product.save is executed first, otherwise no error message will be generated
      expect(@product.errors.full_messages).to include("Name can't be blank") 
    end

    it "fails to create product given name, quantity and category but not price" do
      @category = Category.create(name: "testCategory")
      @product = Product.new(name: "testProduct", price: nil, quantity: 100, category_id: @category.id)
      expect(@product.save).to be_falsey
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end

    it "fails to create product given name, price and category but not quantity" do
      @category = Category.create(name: "testCategory")
      @product = Product.new(name: "testProduct", price: 3009, quantity: nil, category_id: @category.id)
      expect(@product.save).to be_falsey
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it "fails to create product given name, price and quantity but not category" do
      @category = Category.create(name: "testCategory")
      @product = Product.new(name: "testProduct", price: 3009, quantity: 100, category_id: nil)
      expect(@product.save).to be_falsey
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end
    

  end
end
