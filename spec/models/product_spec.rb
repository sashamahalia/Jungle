require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    subject {
      described_class.new(name: 'Sasha', price: 8432, quantity: 8, category_id: 1)
    }
    it "is valid with name, price, quantity and category present" do
      expect(subject).to be_valid
    end

    it "is not valid without a name"
    it "is not valid without a price"
    it "is not valid without a quantity"
    it "is not valid without a category"
  end
end
