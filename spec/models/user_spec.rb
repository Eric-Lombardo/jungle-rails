require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    before(:each) do
      @user_info = {
        first_name: "Stew",
        last_name: "Katz",
        email: "stew_katz@gmail.com",
        password: "test123",
        password_confirmation: "test123"
      }
    end

    it 'should validate if all fields are valid' do
      user = User.create!(@user_info)
      expect(user).to be_valid
    end

    it 'should not validate if password is nil' do
      @user_info[:password] = nil
      user = User.create(@user_info)
      expect(user).to_not be_valid
    end

    it 'should not validate if password_confirmation is nil' do
      @user_info[:password_confirmation] = nil
      user = User.create(@user_info)
      expect(user).to_not be_valid
    end

    it 'should not validate is password and password_confirmation is not the same' do
      @user_info[:password_confirmation] = "wrong_one"
      user = User.create(@user_info)
      expect(user).to_not be_valid
    end
    
    it 'should not validate if email is nil' do
      @user_info[:email] = nil
      user = User.create(@user_info)
      expect(user).to_not be_valid
    end

    it 'should not validate if first_name is nil' do
      @user_info[:first_name] = nil
      user = User.create(@user_info)
      expect(user).to_not be_valid
    end

    it 'should not validate if last_name is nil' do
      @user_info[:last_name] = nil
      user = User.create(@user_info)
      expect(user).to_not be_valid
    end

    it 'unique emails only (emails are lowercase on signup)' do 
      user1 = User.create!(@user_info)
      user_info2 = {
        first_name: "Stew",
        last_name: "Katz",
        email: "stew_katz@gmail.com",
        password: "test123",
        password_confirmation: "test123"
      }

      user_info2[:email].downcase!
      user2 = User.create(user_info2)
      user2.valid?
      expect(user2.errors[:email]).to include("has already been taken")
    end

    it 'validates password with length 2 or more' do
      @user_info[:password] = "hello"
      @user_info[:password_confirmation] = "hello"
      user = User.create(@user_info)
      expect(user).to be_valid
    end

    it 'does not validate password with length 1' do
      @user_info[:password] = "h"
      @user_info[:password_confirmation] = "h"
      user = User.create(@user_info)
      expect(user).to_not be_valid
    end

    it 'removes whitespace from email and still validates' do
      @user_info[:email] = "           stew_katz@gmail.com"
      user = User.create(@user_info)
      expect(user.email).to eq("stew_katz@gmail.com")
    end

    it 'downcases the email' do
      @user_info[:email] = "STEW_kATz@gmAIL.coM"
      user = User.create(@user_info)
      expect(user.email).to eq("stew_katz@gmail.com")
    end

  end
end


# :first_name, 
# :last_name, 
# :email,
# :password,
# :password_confirmation