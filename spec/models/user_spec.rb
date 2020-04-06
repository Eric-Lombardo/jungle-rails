require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    before(:each) do
      @user = User.create!({
        first_name: "Stew",
        last_name: "Katz",
        email: "stew_katz@gmail.com",
        password: "test123",
        password_confirmation: "test123"
      })
    end

    it 'should validate if all fields are valid' do
      expect(@user).to be_valid
    end

    # it 'should not validate if password is nil' do
    #   @user.password = nil
      
    # end

  end
end


# :first_name, 
# :last_name, 
# :email,
# :password,
# :password_confirmation