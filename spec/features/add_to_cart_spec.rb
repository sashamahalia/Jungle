require 'rails_helper'

RSpec.feature "Visitor can add item to cart", type: :feature, js: true do

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

  scenario "They add item to cart" do
    #Cart starts as empty
    expect(page).to have_text "My Cart (0)"
    #click the add button
    click_on('Add', match: :first)
    #cart has one item
    expect(page).to have_text "My Cart (1)"
  end

end