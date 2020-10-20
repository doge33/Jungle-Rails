require 'rails_helper'

RSpec.feature "Visitors can navigate from home to product details page by clicking on the product", type: :feature, js: true do
  
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

  scenario "They can click on individual products on the home page and go to product details page" do
    # ACT
    visit root_path
    #save_screenshot

    first(:link, 'Details').click
    sleep(2)
    # DEBUG / VERIFY
    #save_screenshot

    expect(page).to have_css('.product-detail')
  end
end
