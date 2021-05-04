require 'rails_helper'

RSpec.feature "Visitor navigates to product page from home page", type: :feature, js: true do
  before :each do
    @category = Category.create! name: 'Apparel'
  
      10.times do |n|
        @category.products.create!(
          name: Faker::Hipster.sentence(3),
          description: Faker::Hipster.paragraph(4),
          image: open_asset('apparel1.jpg'),
          quantity: 10,
          price: 64.99
        )
      end
      visit root_path
    end

    scenario "They click on product details and get taken to product page" do
      click_link('Details', match: :first)
      expect(page).to have_text 'Description', count: 1
    end

    scenario "They click on a product name and get taken to product page" do
      click_link(@category.products[0].name)
      expect(page).to have_text 'Description', count: 1
    end

end
