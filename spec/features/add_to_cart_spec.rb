require 'rails_helper'

RSpec.feature "Visitors can add to Carts", type: :feature, js: true do
  
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

  scenario "visitors can click on a product on the home page to add the product to cart" do
    # ACT
    visit root_path
    #save_screenshot

    first(:button, 'Add').click
    sleep(1)
    #save_screenshot

    expect(page).to have_content('My Cart (1)')
  end
end
