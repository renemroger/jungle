require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do
    # SETUP
    before :each do

      @user = User.new(:name => 'max', :email =>'test@test.com',:password => 'test123', :password_confirmation => 'test123').save

      @category = Category.create! name: 'Apparel'
  
      10.times do |n|
        @category.products.create!(
          name:  Faker::Hipster.sentence(3),
          description: Faker::Hipster.paragraph(4),
          image: open_asset('apparel1.jpg'),
          quantity: 10,
          price: 64.99
        )
      end
    end

    scenario "They can see an individual product" do
      # ACT
      visit '/login'

      fill_in 'email', with: 'test@test.com'
      fill_in 'password', with: 'test123'
      click_on('Submit')

      first('.product').click_on('Add')
      

      sleep 2
      # DEBUG
      page.save_screenshot('screen.png') # If providing a custom file name.
      # VERIFY
      expect(page).to have_content("My Cart (1)")
    end
end
