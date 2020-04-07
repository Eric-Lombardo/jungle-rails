require 'rails_helper'

RSpec.feature "Visitor navigates to home page", type: :feature, js: true do

  # SETUP
  before :each do
    @user_info = {
      first_name: "Sporty",
      last_name: "Spice",
      email: "diva_queen90@gmail.com",
      password: "popstar",
      password_confirmation: "popstar"
    }

    user = User.create!(@user_info)
  end

  scenario "existing user can login successfully" do
    # ACT
    visit root_path
    
    find_link('Login').click
    
    fill_in 'email', with: @user_info[:email]
    fill_in 'password', with: @user_info[:password]
    click_on 'Submit'
    
    # VERIFY
    expect(page).to have_content 'Hello, Sporty Spice'
  end

end