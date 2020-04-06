require 'rails_helper'

RSpec.describe Product, type: :model do

  describe 'Validations' do

    before(:each) do
      @category = Category.find_or_create_by! name: 'Motorcycle'
      @product = @category.products.create!({
        name:  'Ducati Streetfighter 848',
        description: "My dream motorcycle",
        quantity: 1,
        price: 16000
      })
    end

    it 'is valid with valid attributes' do
      expect(@product).to be_valid
    end
  end
end


# validates :name, presence: true
# validates :price, presence: true
# validates :quantity, presence: true
# validates :category, presence: true