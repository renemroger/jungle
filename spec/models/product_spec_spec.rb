require 'rails_helper'

RSpec.describe Product, type: :model do
 describe 'Validations' do
  let(:category) {Category.new(:name => 'Beverage')}
  let(:product) {Product.new(:name => 'Coca', :price_cents => 1200, :quantity => 6, :category => category)}


  it"product is valid when containing all fields" do
    expect(product).to be_valid
  end

  it "is not valid without a name" do
    product.name = nil
    expect(product).not_to be_valid
  end
  
  it "is not valid without a price" do
    product.price_cents = nil
    expect(product).not_to be_valid
  end
  
  it "is not valid without a quantity" do
    product.quantity = nil
    expect(product).not_to be_valid
  end

  it "is not valid without a category" do
    product.category = nil
    expect(product).not_to be_valid
  end
  

 end
end
