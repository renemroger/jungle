require 'rails_helper'

RSpec.describe User, type: :model do

  let(:user) {User.new(:name => 'max', :email =>'max1@max.com',:password => '123123', :password_confirmation => '123123')}

  describe 'Validations' do
    it"product is valid when containing all fields" do
      expect(user).to be_valid
    end

    it"is not valid without a name" do
      user.name = nil
      expect(user).not_to be_valid
    end

    it"is not valid without a email" do
      user.email = nil
      expect(user).not_to be_valid
    end

    it"is not valid without a password" do
      user.password = nil
      expect(user).not_to be_valid
    end

    it"is not valid without a password_confirmation" do
      user.password_confirmation = nil
      expect(user).not_to be_valid
    end
  
    it 'Password and Password_confirmation must match' do
      user.password.should eq(user.password_confirmation)
    end
    
    it 'should validate uniqueness of email' do
      User.create(:name => 'max', :email =>'max@max.com',:password => '123123', :password_confirmation => '123123').save
      user1 = User.new(:name => 'max', :email =>'max@max.com',:password => '123123', :password_confirmation => '123123')
      expect(user1).not_to be_valid
    end

    it 'should validate password length' do
      user1 = User.new(:name => 'max', :email =>'max@max.com',:password => '123', :password_confirmation => '123')
      expect(user1).not_to be_valid
    end
  end

  describe '.authenticate_with_credentials' do
    it 'validate with extra trailing spaces' do
      user1 = User.authenticate_with_credentials('    max312@max.com   ', '12345678')
      expect(user1).to be_valid
    end

    it 'validate with extra casing problems' do
      user1 = User.authenticate_with_credentials('maX@max.com', '12345678')
      expect(user1).to be_valid
    end

  end
  

end
