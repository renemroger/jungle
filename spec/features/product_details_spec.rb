require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do
    # SETUP
    before :each do
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
      visit '/'

      first('.product').click_on('Details')

      # DEBUG
      page.save_screenshot('screen.png', full: true) # If providing a custom file name.
      # VERIFY
      expect(page).to have_css('.products-show')
    end
end
