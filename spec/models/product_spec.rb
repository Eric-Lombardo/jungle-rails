require 'rails_helper'

RSpec.describe Product, type: :model do

  describe 'Validations' do

    before(:each) do
      @category = Category.find_or_create_by! name: 'Motorcycle'
      @product = @category.products.create!({
        name:  'Ducati Streetfighter 848',
        quantity: 1,
        price: 16000
      })
    end

    it 'is valid with valid attributes' do
      expect(@product).to be_valid
    end

    it 'should not validate if name is nil' do
      @product.name = nil
      expect(@product).to_not be_valid
      expect(@product.errors.messages[:name]).to include("can't be blank")
    end

    it 'should not validate if quantity is nil' do
      @product.quantity = nil
      expect(@product).to_not be_valid
      expect(@product.errors.messages[:quantity]).to include("can't be blank")
    end

    it 'should not validate if price is nil' do 
      @product.price_cents = nil
      expect(@product).to_not be_valid
      expect(@product.errors.messages[:price]).to include("can't be blank")
    end

    it 'should not validate if category is nil' do
      @product.category = nil
      expect(@product).to_not be_valid
      expect(@product.errors.messages[:category]).to include("can't be blank")
    end

  end
end

