require 'rails_helper'

RSpec.feature "Visitor navigates to home page", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        quantity: 10,
        price: 64.99,
        image: open_asset('apparel1.jpg')
      )
    end
  end

  scenario "They see product details of 1 specific product" do
    # ACT
    visit root_path
    expect(page).to have_content 'My Cart (0)'
    find_button('Add', match: :first).click
    
    # VERIFY
    expect(page).to have_content 'My Cart (1)'
  end

end